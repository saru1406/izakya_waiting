class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to customer_path
    else
      flash[:alret] = "項目を全て記入してください。"
      @customer = current_customer
      render :edit
    end
  end

  def destroy
    customer = current_customer
    customer.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name)
  end

  def ensure_guest_customer
    @customer = current_customer
    if @customer.name == "guestuser"
      flash[:alret] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      redirect_to customer_path(current_customer)
    end
  end
end
