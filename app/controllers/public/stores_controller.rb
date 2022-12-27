class Public::StoresController < ApplicationController
  before_action :authenticate_customer!

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
    else
      @stores = @q.result(distinct: true).published
    end

    #複数タグを検索
    if params[:tag_ids]
      @stores = []
      params[:tag_ids].each do |key, value|
        @stores += Tag.find_by(name: key).stores.published if value == "1"
      end
      @stores.uniq!
    end
  end

  def show
    @store = Store.find(params[:id])
    @review = Review.new
    @reviews = @store.reviews.all
    @customer = current_customer
    @tags = Tag.all
  end
end