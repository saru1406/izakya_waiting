class Public::CustomersController < ApplicationController

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
      redirect_to customers_my_page_path
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
end
