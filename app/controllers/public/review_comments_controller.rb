class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:review_id])
    @review_comments = @review.review_comments.all
    review_comment = ReviewComment.new(review_comment_params)
    review_comment.customer_id = current_customer.id
    review_comment.review_id = @review.id
    review_comment.store_id = @store.id
    review_comment.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.find(params[:id])
    @review_comments = @review.review_comments.all
    @customer = current_customer
    #デベロッパーツールでid書き換えによる他のユーザーコメントを削除できない様制限
    if @review_comment.customer_id == @customer.id
      @review_comment.destroy
    end
  end

  def index
    @customer = current_customer
    @review_comments = @customer.review_comments.all
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end

