class Administrator::NotificationsController < ApplicationController
  before_action :authenticate_administrator!, only: %i[index]

  def index
    @notifications = Notification.where(action: "application")
  end
end
