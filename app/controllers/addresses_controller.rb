class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    @user = current_user
    authorize @address
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    authorize @address
    if @address.save!
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:city, :street, :numer, :neighborhood, :cep)
  end
end
