class Public::StoresController < ApplicationController

  def index
    @stores = Store.all
    @tag = Tag.all
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
    @tag = Tag.all
  end

  def search
    #絞り込み機能　空席情報、禁煙・喫煙
    @tag = Tag.all
    @stores = Store.where('seat_status LIKE(?) and smoke_status LIKE(?)', "%#{params[:seat_status]}%","%#{params[:smoke_status]}%")
    render :index
  end
end