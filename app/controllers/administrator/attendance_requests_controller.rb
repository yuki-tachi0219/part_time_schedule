class Administrator::AttendanceRequestsController < ApplicationController
  def index
    @attendance_requests = AttendanceRequest.all.joins(:schedule).order("schedules.starting_time DESC")
  end

  def edit
    @attendance_request = AttendanceRequest.find_by(id: params[:id])
  end

  def update
    ActiveRecord::Base.transaction do
      attendance_request = AttendanceRequest.find_by(id: params[:id])
      attendance_request.update!(attendance_request_params)
      if params[:absence_request][:state] == "approval"
        attendance_request.notifications.create!(action: "approval")
      else
        attendance_request.notifications.create!(action: "rejection")
      end
      redirect_to administrator_attendance_requests_path, notice: "シフト申請編集が完了しました"
    end
  rescue
    redirect_to administrator_attendance_requests_path, alert: "シフト申請編集に失敗しました"
  end

  private

    def attendance_request_params
      params.require(:attendance_request).permit(:state)
    end
end
