class Public::StoresController < ApplicationController
  before_action :authenticate_customer!

  def index
    @stores = Store.all
    @tags = Tag.all
    #サイドバーのタグ検索
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
    @tags = Tag.all
    @stores = Store.where('seat_status LIKE(?) and smoke_status LIKE(?)', "%#{params[:seat_status]}%","%#{params[:smoke_status]}%")
    render :index
  end
end