class Public::HomesController < ApplicationController

  def top
    #居酒屋情報の数を指定, 掲載情報を公開のみ表示
    @stores = Store.order('id ASC').limit(5).published
  end
end
