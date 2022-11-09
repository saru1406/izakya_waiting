class Public::StoresController < ApplicationController

  def index
    @stores = Store.all
    @tag = Tag.all
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
end
