class Public::ReviewCommentsController < ApplicationController

  def create
    store = Store.find(params[:store_id])
    review = Review.find(params[:review_id])
    review_comment =ReviewComment.new(review_comment_params)
    review_comment.customer_id = current_customer.id
    review_comment.review_id = review.id
    review_comment.store_id = store.id
    if review_comment.save
      redirect_to store_review_path(store.id,review.id)
    else
      render :reviews/show
    end
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    review_comment.destroy
    store = Store.find(params[:store_id])
    review = Review.find(params[:review_id])
    redirect_to store_review_path(store.id,review.id)
  end

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end

