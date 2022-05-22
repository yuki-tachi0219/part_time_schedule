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
    @administrator = Administrator.find_by(id: params[:id])
  end

  def edit
    @administrator = Administrator.find_by(id: params[:id])
  end

  def update
    @administrator = Administrator.find_by(id: params[:id])
    if @administrator.update(administrator_params)
      flash[:success] = "管理者情報を更新しました。"
      redirect_to administrator_administrator_path(@administrator)
    else
      render "edit"
    end
  end

  private

    def administrator_params
      params.require(:administrator).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
    end

    def correct_administrator
      administrator = Administrator.find_by(id: params[:id])
      if administrator != current_administrator
        flash[:notice] = "他人の情報にアクセスすることはできません。"
        redirect_to root_path
      end
    end
end
