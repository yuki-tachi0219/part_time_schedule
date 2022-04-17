class Employee::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
end
