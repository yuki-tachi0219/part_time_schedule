class Employee::AbsenceRequestsController < ApplicationController
  before_action :authenticate_employee!, only: %i[index new show]

  def index
    if employee_signed_in?
      relation = AbsenceRequest.joins(:schedule)
      @absence_requests = relation.where( schedules: { employee_id: current_employee.id } )
    end
  end

  def new
    @absence_request = AbsenceRequest.new
    @schedule = current_employee.schedules.find_by(id: params[:schedule_id])
  end

  def create
    # シフト申請、勤怠情報、通知をまとめて登録するためトランザクション処理
    ActiveRecord::Base.transaction do
      absence_request = current_employee.schedules.find_by(id: params[:schedule_id]).build_absence_request(absence_request_params)
      absence_request.save!

      absence_request.absence_request_notifications.create!(notification: Notification.new)
      redirect_to employee_schedules_path, notice: "欠勤申請登録が完了しました"
    end
  rescue
    redirect_to employee_schedules_path, alert: "欠勤申請登録に失敗しました"
  end

  def show
    @absence_request = AbsenceRequest.find_by(id: params[:id])
  end

  private

    def absence_request_params
      params.permit(:reason)
    end
end
