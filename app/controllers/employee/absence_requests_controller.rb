class Employee::AbsenceRequestsController < ApplicationController

  def index
    @absence_requests = AbsenceRequest.all
  end

  def new
    @absence_request = AbsenceRequest.new
    @schedule = current_employee.schedules.find_by(id: params[:schedule_id])
  end

  def create
    absence_request = current_employee.schedules.find_by(id: params[:schedule_id]).build_absence_request(absence_request_params)
      if absence_request.save
        flash[:success] = "欠勤申請しました。"
        redirect_to employee_absence_requests_path
      else
        flash[:danger] = "欠勤申請を登録できませんでした。"
        render "new"
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
