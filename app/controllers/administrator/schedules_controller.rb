class Administrator::SchedulesController < ApplicationController
  before_action :authenticate_administrator!, only: %i[index]

  def index
    @events = Schedule.all
  end
end
