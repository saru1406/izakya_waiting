class Public::BookmarksController < ApplicationController

  def index
    @customer = current_customer
    @bookmarks = @customer.bookmarks.all
  end

  def create
    @customer = current_customer
    @store = Store.find(params[:store_id])
    bookmark = @customer.bookmarks.new(store_id: @store.id)
    bookmark.save
  end

  def destroy
    @customer = current_customer
    @store = Store.find(params[:store_id])
    bookmark = @customer.bookmarks.find_by(store_id: @store.id)
    bookmark.destroy
  end
end
