class Employee::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end

  def update
    @schedule = Schedule.find_by(id: params[:id])
    @schedule.employee_id = current_employee.id
    if @schedule.update(schedules_params)
      redirect_to employee_schedules_path, notice:"シフトを編集しました。"
    else
      flash[:danger] = "シフトを編集できませんでした。"
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find_by(id: params[:id]).destroy!
    redirect_to employee_schedules_path, notice:"削除しました"
  end

private

  def schedules_params
    params.require(:schedule).permit(:starting_time, :closing_time)
  end

end
