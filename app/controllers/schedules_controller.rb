class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  # def new
  #   @schedule = Schedule.new
  # end

  def create
    @schedule = Schedule.new(user_params)
  end

  def edit
    @schedule = Schedules.find_by(id: params[:id])
  end

  def update
    @schedule = Schedules.find_by(id: params[:id])
    @schedule.user_id = current_user.id
    if @schedule.update(schedule_params)
      flash[:success] = "シフトを編集しました。"
      redirect_to schedules_path
    else
      flash[:danger] = "シフトを編集できませんでした。"
      render :edit
    end
  end

  def destroy
    @schedule = Schedules.find_by(id: params[:id])
    redirect_to schedules_path, notice:"削除しました"
  end
end
