class Admin::StoresController < ApplicationController

  def index
    @stores =Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    store = Store.find(params[:id])
    if store.update(store_params)
     redirect_to admin_store_path
    else
     @store = Store.find(params[:id]) 
     render :edit
    end  
  end
  
  
  private
  def store_params
    params.require(:store).permit(:name, :budget_min, :budget_max, :address, :telephone_number, :seat_status, :business_hours, :regular_holiday, :smoke_status, :service_charge, :email)
  end
end
