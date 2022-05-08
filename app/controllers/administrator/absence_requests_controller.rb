class Administrator::AbsenceRequestsController < ApplicationController
  before_action :authenticate_administrator!, only: %i[index edit]

  def index
    @absence_requests = AbsenceRequest.all
  end

  def edit
    @absence_request = AbsenceRequest.find_by(id: params[:id])
  end

  def update
    ActiveRecord::Base.transaction do
      absence_request = AbsenceRequest.find_by(id: params[:id])
      absence_request.update(absence_request_params)
      absence_request.absence_request_notifications.create!(notification: Notification.new)
      redirect_to administrator_absence_requests_path, notice: "欠勤申請編集が完了しました"
    end
  rescue
    redirect_to administrator_absence_requests_path, alert: "欠勤申請編集に失敗しました"
  end

  private

    def absence_request_params
      params.require(:absence_request).permit(:state)
    end
end
