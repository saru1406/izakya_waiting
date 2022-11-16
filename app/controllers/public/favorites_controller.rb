class Public::FavoritesController < ApplicationController

  def create
    @customer = current_customer
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:review_id])
    favorite = @customer.favorites.new(review_id: @review.id, store_id: @store.id)
    favorite.save
  end

  def destroy
    @customer = current_customer
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:review_id])
    favorite = @customer.favorites.find_by(review_id: @review.id, store_id: @store.id)
    favorite.destroy
  end
end
