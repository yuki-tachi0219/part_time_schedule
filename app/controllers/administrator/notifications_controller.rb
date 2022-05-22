class Administrator::NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(action: "application").order(created_at: "DESC")
  end
end
