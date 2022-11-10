class Public::HomesController < ApplicationController
  def top
    @tag = Tag.all
    @stores = Store.order('id ASC').limit(5)
  end
end
