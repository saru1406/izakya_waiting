class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_customer_path
    else
      flash[:alret] = "項目を全て記入してください。"
      render :edit
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to admin_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name)
  end
end