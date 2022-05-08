class Administrator::AdministratorsController < ApplicationController
  before_action :authenticate_administrator!, only: %i[show edit update]
  before_action :correct_administrator, only: %i[show edit update]
  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      flash[:success] = "ユーザーを登録しました。こちらからログインしてください。"
      redirect_to administrator_session_path
    else
      flash[:danger] = "管理者登録に失敗しました。正しく入力されているか確認し、もう一度登録し直してください。"
      render "new"
    end
  end

  def show
    @administrator = Administrator.find(params[:id])
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])
    if @administrator.update(administrator_params)
      flash[:success] = '管理者情報を更新しました。'
      redirect_to root_path
    else
      render "edit"
    end
  end

  def index_employee
    @employee = Employee.all
  end

  def new_employee
    @employee = Employee.new
  end

  def create_employee
    @employee = Employee.new(employee_params)
    if @employee.save!
      flash[:success] = '従業員を登録しました。'
      redirect_to index_employee_administrator_administrator_path(current_administrator)
    else
      flash.now[:danger] = '従業員登録に失敗しました。正しく入力されているか確認し、もう一度登録し直してください。'
      render :new_employee
    end
  end

  def show_employee
    @employee = Employee.find(params[:id])
  end

  def edit_employee
    @employee = Employee.find(params[:id])
  end

  def update_employee
    @employee = Employee.find(params[:id])
    flash[:success] = '従業員情報を更新しました'
    if @employee.update(employee_params)
      redirect_to index_employee_administrator_administrator_path(current_administrator)
    else
      render 'edit_employee'
    end
  end

  def destroy_employee
    employee = Employee.find(params[:id])
    employee.destroy!
    flash[:success] = '従業員情報を削除しました'
    redirect_to index_employee_administrator_administrator_path
  end

private

  def administrator_params
    params.require(:administrator).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end

  def correct_administrator
    administrator = Administrator.find(params[:id])
    if administrator != current_administrator
      flash[:notice] = "他人の情報にアクセスすることはできません。"
      redirect_to root_path
    end
  end
end
