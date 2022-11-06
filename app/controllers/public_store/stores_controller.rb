class PublicStore::StoresController < ApplicationController

  def show
    @store = current_store
  end

end
