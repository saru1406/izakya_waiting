class Public::StoresController < ApplicationController
  before_action :authenticate_customer!

  def index
    #掲載情報を公開のみ一覧に表示
    @store = Store.published
    #表示順分岐
    if params[:latest]
      @stores = @store.latest
    elsif params[:old]
      @stores = @store.old
    elsif params[:review_count]
      @stores = @store.review_amount
    elsif params[:review_star]
      @stores = @store.star_avg
    else
      #ransack検索
      @stores = @q.result(distinct: true).published
    end
    @tags = Tag.all
    #タグ
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