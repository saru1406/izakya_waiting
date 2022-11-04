class Public::ReviewsController < ApplicationController

  def create
    store = Store.find(params[:store_id])
    review = Review.new(review_params)
    review.customer_id = current_customer.id
    review.store_id = store.id
    if review.save!
      redirect_to store_review_path(review.id)
    else
      @store = Store.find(params[:id])
      @reviews = Review.all
      render :"store/show"
    end
  end

  def show
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
