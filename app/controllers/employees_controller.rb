class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(user_params)
      redirect_to @employee
    else
      render "edit"
    end
  end

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end
end
