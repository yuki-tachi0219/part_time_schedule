class Administrator::NotificationsController < ApplicationController
  before_action :authenticate_administrator!, only: %i[index]

  def index
    @notifications = Notification.where(action: "application").page(params[:page]).per(10)
  end
end
