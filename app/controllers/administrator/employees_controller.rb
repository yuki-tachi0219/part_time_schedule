class Administrator::EmployeesController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @employee = Employee.page(params[:page]).per(10)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save!
      flash[:success] = "従業員を登録しました。"
      redirect_to administrator_employees_path
    else
      flash.now[:danger] = "従業員登録に失敗しました。正しく入力されているか確認し、もう一度登録し直してください。"
      render :new_employee
    end
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    flash[:success] = "従業員情報を更新しました"
    if @employee.update(employee_params)
      redirect_to administrator_employees_path
    else
      render "edit_employee"
    end
  end

  def destroy
    employee = Employee.find_by(id: params[:id])
    employee.destroy!
    flash[:success] = "従業員情報を削除しました"
    redirect_to administrator_employees_path
  end

  private

    def employee_params
      params.require(:employee).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
    end
end
