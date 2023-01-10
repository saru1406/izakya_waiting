class Public::StoresController < ApplicationController
  before_action :authenticate_customer!
  before_action :search

  def index
    #ransack検索,published<=掲載情報を公開のみ一覧に表示
    @stores = @q.result(distinct: true).published
    @tags = Tag.all
    #表示順分岐
    if params[:latest]
      @stores = @stores.latest
    elsif params[:old]
      @stores = @stores.old
    elsif params[:review_count]
      @stores = @stores.review_amount
    elsif params[:review_star]
      @stores = @stores.star_avg
    end
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
    @reviews = @store.reviews.all
    @customer = current_customer
    @tags = Tag.all
  end
  
  def search
    #絞り込み機能　空席情報、禁煙・喫煙、予算
    @q = Store.ransack(params[:q])
  end
end