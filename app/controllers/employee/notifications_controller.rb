class Employee::NotificationsController < ApplicationController

  def index
    relation = Notification.left_joins(attendance_requests: :schedule, absence_requests: :schedule)
    @notifications = relation.where(attendance_requests: { schedules: { employee_id: current_employee.id } })
                            .or(relation.where(absence_requests: { schedules: { employee_id: current_employee.id } }))
                            .distinct.where.not(action: "application")

  end

end
