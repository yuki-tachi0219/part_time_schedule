class Administrator::NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(action: "application")
  end
end
