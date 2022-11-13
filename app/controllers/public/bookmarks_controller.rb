class Public::BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def create
    @store = Store.find(params[:store_id])
    bookmark = current_customer.bookmarks.new(store_id: @store.id)
    bookmark.save
  end

  def destroy
    @store = Store.find(params[:store_id])
    bookmark = current_customer.bookmarks.find_by(store_id: @store.id)
    bookmark.destroy
  end
end
