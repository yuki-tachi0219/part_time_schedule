class Administrator::NotificationsController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @notifications = Notification.where(action: "application")
  end
end
