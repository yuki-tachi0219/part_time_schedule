class AdministratorsController < ApplicationController
  before_action :authenticate_administrator!, only: %i[show edit update]

  def new
    @administrator = Administrator.new
  end

  def show
    @administrator = Administrator.find(params[:id])
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      flash[:success] = '管理者を登録しました。こちらからログインしてください。'
      redirect_to new_administrator_session_path
    else
      flash.now[:danger] = '管理者登録に失敗しました。正しく入力されているか確認し、もう一度登録し直してください。'
      render :new
    end
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])
    if @administrator.update(administrator_params)
      redirect_to @administrator
    else
      render 'edit'
    end
  end

  def index_employee
    @employee = Employee.all
  end

  def new_employees
    @employee = Employee.new(employee_params)
  end

  def create_employees
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = '従業員を登録しました。'
    else
      flash.now[:danger] = '従業員登録に失敗しました。正しく入力されているか確認し、もう一度登録し直してください。'
      render :new_employee
    end
  end

  def show_employees
    @employee = Employee.find(params[:id])
  end

  def edit_employees
    @employee = Employee.find(params[:id])
  end

  def update_employees
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit_employee'
    end
  end

  def destroy_employees
    employee = Employee.find(params[:id])
    employee.destroy!
    flash[:success] = '従業員情報を削除しました'
    redirect_to show_employee_path
  end

  def administrator_params
    params.require(:administrator).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end
end
