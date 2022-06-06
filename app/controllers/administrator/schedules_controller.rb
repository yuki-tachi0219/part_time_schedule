class Administrator::SchedulesController < ApplicationController
  before_action :authenticate_administrator!, only: %i[index]

  def index
    @schedules = Schedule.all
  end
end
