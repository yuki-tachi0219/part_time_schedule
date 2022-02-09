class AttendanceRequestsController < ApplicationController

  def index
    @attendance_requests = AttendanceRequest.all
  end

  def new
    @attendance_request = AttendanceRequest.new
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

  # 以下コメントアウト分は機能実装時に内容を修正し反映させます
  def show
    # @attendance_request = AttendanceRequest.find(params[:id])
  end

  def edit
    # @attendance_request = AttendanceRequest.find(params[:id])
  end

  def update
    # @attendance_request = AttendanceRequest.find(params[:id])
  end

  def destroy
    # @attendance_request = AttendanceRequest.find(params[:id])
  end
end
