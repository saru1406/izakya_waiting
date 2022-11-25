class Public::StoresController < ApplicationController
  before_action :authenticate_customer!

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
end