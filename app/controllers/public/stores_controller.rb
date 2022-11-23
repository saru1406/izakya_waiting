class Public::StoresController < ApplicationController
  before_action :authenticate_customer!
  before_action :search

  def index
    #掲載情報を公開のみ一覧に表示
    @stores = @q.result(distinct: true).published
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

  def search
    #絞り込み機能　空席情報、禁煙・喫煙
    @q = Store.ransack(params[:q])

  end
end