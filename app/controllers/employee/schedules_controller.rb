class Employee::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all.order(starting_time: "DESC")
  end
end
