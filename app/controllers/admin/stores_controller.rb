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
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_store_path
    else
      flash[:alret] = "項目を全て記入してください。"
      @store = Store.find(params[:id])
      render :edit
    end
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to admin_stores_path
  end


  private
  def store_params
    params.require(:store).permit(:name, :budget_min, :budget_max, :address, :telephone_number, :seat_status, :business_hours, :regular_holiday, :smoke_status, :service_charge, :email, :image, tag_ids:[])
  end
end
