class Public::FavoritesController < ApplicationController

  def create
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:review_id])
    favorite = current_customer.favorites.new(review_id: @review.id, store_id: @store.id)
    favorite.save
  end

  def destroy
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:review_id])
    favorite = current_customer.favorites.find_by(review_id: @review.id, store_id: @store.id)
    favorite.destroy
  end
end