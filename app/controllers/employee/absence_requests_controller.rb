class Employee::AbsenceRequestsController < ApplicationController

  def index
    @absence_requests = AbsenceRequest.all
  end

  def new
     binding.pry
    @absence_request = AbsenceRequest.new
    @schedule = current_employee.schedules.find_by(id: params[:schedule_id])
  end

  # def create
  #   absence_request = current_employee.schedules.find_by(id: params[:schedule_id]).build_absence_request(absence_request_params)
  #     if absence_request.save
  #       flash[:success] = "欠勤申請しました。"
  #       redirect_to employee_absence_requests_path
  #     else
  #       flash[:danger] = "欠勤申請を登録できませんでした。"
  #       render "new"
  #     end
  # end

  def create
    # シフト申請、勤怠情報、通知をまとめて登録するためトランザクション処理
    ActiveRecord::Base.transaction do

      absence_request = current_employee.schedules.find_by(id: params[:schedule_id]).build_absence_request(absence_request_params)
      absence_request.save!

      absence_request.absence_request_notifications.create!(notification: Notification.new)
      redirect_to employee_schedules_path, notice: "欠勤申請登録が完了しました"
    rescue => e
      redirect_to employee_schedules_path, alert: "欠勤申請登録に失敗しました"
  end
end


  def show
    @absence_request = AbsenceRequest.find_by(id: params[:id])
  end

  private

  def absence_request_params
    params.permit(:reason)
  end

end
