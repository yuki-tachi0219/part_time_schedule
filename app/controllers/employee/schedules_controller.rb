class Employee::SchedulesController < ApplicationController
  before_action :authenticate_employee!, only: %i[index]

  def index
    if employee_signed_in?
      @schedules = Schedule.where(employee_id: current_employee.id)
    end
  end
end
