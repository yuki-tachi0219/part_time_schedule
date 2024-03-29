class Employee::SchedulesController < ApplicationController
  before_action :authenticate_employee!, only: %i[index]

  def index
    @schedules = Schedule.where(employee_id: current_employee.id)
  end
end
