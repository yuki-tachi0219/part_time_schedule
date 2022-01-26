class Employee::AbsenceRequestsController < ApplicationController

  def index
    @absence_requests = AbsenceRequest.all
  end

  def new
    @absence_request = AbsenceRequest.new
  end

  def create
    @attendance_request = AttendanceRequest.new(attendance_request_params)
    @attendance_request.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @attendance_request.save
        redirect_to attendance_requests_path
        render :new
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
  end

  def destroy
    @attendance_request = AttendanceRequest.find(params[:id])
  end
end
