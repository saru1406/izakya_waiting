class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :search

  def admin_url
    request.fullpath.include?("/admin")
  end

  def search
    #絞り込み機能　空席情報、禁煙・喫煙
    @q = Store.ransack(params[:q])
  end
end