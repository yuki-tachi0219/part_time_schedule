class Administrator::AdministratorsController < ApplicationController
  def show
    @administrator = Administrator.find(params[:id])
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])
    if @administrator.update(administrator_params)
      redirect_to @administrator
    else
      render "edit"
    end
  end

  def administrator_params
    params.require(:administrator).permit(:last_name, :first_name, :password, :zipcode, :address, :email, :phone_number)
  end
end
