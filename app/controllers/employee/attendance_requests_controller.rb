class Employee::AttendanceRequestsController < ApplicationController
  before_action :authenticate_employee!, only: %i[index new show]

  def index
    relation = AttendanceRequest.joins(:schedule)
    @attendance_requests = relation.where(schedules: { employee_id: current_employee.id }).page(params[:page]).per(10)
  end

  def new
    @attendance_request = AttendanceRequest.new
  end

  def create
    # シフト申請、勤怠情報、通知をまとめて登録するためトランザクション処理
    ActiveRecord::Base.transaction do
      schedule = Schedule.new(schedules_params)
      schedule.employee_id = current_employee.id
      schedule.save!

      attendance_request = schedule.build_attendance_request(attendance_requests_params)
      attendance_request.save!

      attendance_request.attendance_request_notifications.create!(notification: Notification.new)
      redirect_to employee_schedules_path, notice: "シフト申請登録が完了しました"
    end
  rescue
    redirect_to employee_schedules_path, alert: "シフト申請登録に失敗しました"
  end

  def show
    @attendance_request = AttendanceRequest.find_by(id: params[:id])
  end

  private

    def attendance_requests_params
      params.require(:attendance_request).permit(:state)
    end

    def schedules_params # rubocop:disable Metrics/AbcSize
      carry_time = DateTime.new(params[:attendance_request][:"starting_time(1i)"].to_i, params[:attendance_request][:"starting_time(2i)"].to_i,
                                params[:attendance_request][:"starting_time(3i)"].to_i, params[:attendance_request][:"starting_time(4i)"].to_i,
                                params[:attendance_request][:"starting_time(5i)"].to_i)
      soup_time = DateTime.new(params[:attendance_request][:"closing_time(1i)"].to_i, params[:attendance_request][:"closing_time(2i)"].to_i,
                               params[:attendance_request][:"closing_time(3i)"].to_i, params[:attendance_request][:"closing_time(4i)"].to_i,
                               params[:attendance_request][:"closing_time(5i)"].to_i)
      params[:attendance_request].merge!(starting_time: carry_time, closing_time: soup_time)
      params.require(:attendance_request).permit(:starting_time, :closing_time)
    end
end
