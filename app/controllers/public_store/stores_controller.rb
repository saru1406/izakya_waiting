class PublicStore::StoresController < ApplicationController
  before_action :authenticate_store!

  def show
    @store = current_store
  end

  def edit
    @store = current_store
  end

  def update
    store = current_store
    if store.update(store_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to public_store_stores_my_page_path
    else
      flash[:alret] = "項目を全て記入してください。"
      @customer = current_store
      render :edit
    end
  end

  def destroy
    store = current_store
    store.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
  end

  private
  def store_params
    params.require(:store).permit(:name, :budget_min, :budget_max, :address, :telephone_number, :seat_status, :business_hours, :regular_holiday, :smoke_status, :service_charge, :email, :image, :is_published, tag_ids:[])
  end
end
