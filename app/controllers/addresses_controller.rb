class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    authorize @address
  end

  def create

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
