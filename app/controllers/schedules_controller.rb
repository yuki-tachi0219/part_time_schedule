class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  # def new
  #   @schedule = Schedule.new
  # end

  def create
    @schedule = Schedule.new(user_params)
    # @user.user_classification_id = 1 # ユーザー種別を購入者に限定する
    if @schedule.save
      flash[:success] = "シフトを登録しました。"
      redirect_to schedules_path
    else
      flash[:danger] = "シフトを登録できませんでした。"
      redirect_to schedules_path
    end
  end

  def edit
  end

  def update
    @schedule = Schedules.find_by(id: params[:id])
  end

  def destroy
    @schedule = Schedules.find_by(id: params[:id])
    redirect_to schedules_path, notice:"削除しました"
  end
end
