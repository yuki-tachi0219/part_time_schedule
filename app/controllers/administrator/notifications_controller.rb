class Administrator::NotificationsController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @notifications = Notification.where(action: "application").page(params[:page]).per(10)
  end
end
