class Employee::EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: %i[show edit update]
  before_action :correct_employee, only: %i[show edit update]

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(employee_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
    end

    def correct_employee
      employee = Employee.find_by(id: params[:id])
      if employee != current_employee
        flash[:notice] = "他人の情報にアクセスすることはできません。"
        redirect_to root_path
      end
    end
end
