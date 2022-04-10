class Employee::NotificationsController < ApplicationController

  def index
 binding.pry
    @notifications = current_employee.id
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    # @notifications = Notification.all
  end

end
