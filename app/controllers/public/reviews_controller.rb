class Public::ReviewsController < ApplicationController

  def create
    store = Store.find(params[:store_id])
    review = Review.new(review_params)
    review.customer_id = current_customer.id
    review.store_id = store.id
    if review.save
      redirect_to store_path(store.id)
    else
      @store = Store.find(params[:id])
      @reviews = Review.all
      render :"store/show"
    end
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      store = Store.find(params[:store_id])
      redirect_to store_path(store.id)
    else
      @store = Store.find(params[:id])
      @reviews = Review.all
      render :"store/show"
    end
  end

  def index
    @customer = current_customer
    @reviews = @customer.reviews.all
  end

  def show
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
    @review_comments = @review.review_comments.all
    @review_comment =ReviewComment.new
  end

  def edit
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    store = Store.find(params[:store_id])
    redirect_to store_path(store.id)
  end

  def review_params
    params.require(:review).permit(:title, :body, :star)
  end
end
