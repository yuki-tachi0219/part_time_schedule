class Employee::NotificationsController < ApplicationController

  def index
    @notifications = Notification.joins(attendance_requests: :schedule).where(attendance_requests: { schedules: { employee_id: current_employee.id } }).distinct.where.not(action: "application")

  end

end
