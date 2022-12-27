class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @store = Store.find(params[:store_id])
    @customer = current_customer
    @review = Review.new(review_params)
    @review.customer_id = @customer.id
    @review.store_id = @store.id
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to store_path(@store.id)
    else
      flash[:alret] = "項目を全て記入してください。"
      @tags = Tag.all
      @reviews = @store.reviews.all
      render :'public/stores/show'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      @store = Store.find(params[:store_id])
      flash[:notice] = "レビューを更新しました。"
      redirect_to store_review_path(@store,@review)
    else
      @store = Store.find(params[:store_id])
      flash[:alret] = "項目を全て記入してください。"
      render :"public/reviews/edit"
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @reviews = @customer.reviews.all
  end

  def show
    @customer = current_customer
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
    @review_comments = @review.review_comments.all
    @review_comment =ReviewComment.new
    @tags = Tag.all
  end

  def edit
    @store = Store.find(params[:store_id])
    @review = Review.find(params[:id])
    #アクセス制限　投稿したユーザーのみ遷移可能
    if @review.customer != current_customer
      redirect_to stores_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @customer = current_customer
    @store = Store.find(params[:store_id])
    #デベロッパーツールでid書き換えによる他のユーザーレビューを削除できない様制限
    if @review.customer_id == @customer.id
      @review.destroy
      redirect_to store_path(@store)
    else
      @review_comments = @review.review_comments.all
      @review_comment =ReviewComment.new
      @tags = Tag.all
      render :'show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :star, review_image: [])
  end
end
