class Employee::AttendanceRequestsController < ApplicationController

  def index
    @attendance_requests = AttendanceRequest.all
  end

  def new
    if params[:back]
      @attendance_request = AttendanceRequest.new
    end
  end

  def create
    if params[:back]
      @attendance_request = AtendanceRequest.new
      render :new
    else
      if @attendance_request.save
        redirect_to employee_schedules_path
      end
    end
  end

  def show
    @attendance_request = AttendanceRequest.find(params[:id])
  end

  def edit
    @attendance_request = AttendanceRequest.find(params[:id])
  end

  def update
    @attendance_request = AttendanceRequest.find(params[:id])
    if @attendance_request.update(attendance_request_params)
      redirect_to attendance_requests_path
    else
      render :edit
    end
  end

  def destroy
    @attendance_request = AttendanceRequest.find(params[:id])
  end
end

private

def attendance_requests_params
  params.require(:attendance_request).permit(:state, :employee_id, :administrator_id)
end
