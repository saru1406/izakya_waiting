class Public::StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
    @reviews = @store.reviews.all
    @customer = current_customer
  end
end
