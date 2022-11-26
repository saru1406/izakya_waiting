class Public::StoresController < ApplicationController
  before_action :authenticate_customer!

  def index
    #表示順分岐
    if params[:latest]
      @stores = Store.latest
    elsif params[:old]
      @stores = Store.old
    elsif params[:review_count]
      @stores = Store.review_amount
    elsif params[:review_star]
      @stores = Store.star_avg
    else
      #ransack検索、掲載情報を公開のみ一覧に表示
      @stores = @q.result(distinct: true).published
    end
    @tags = Tag.all
    if params[:tag_ids]
      @stores = []
      params[:tag_ids].each do |key, value|
        @stores += Tag.find_by(name: key).stores if value == "1"
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