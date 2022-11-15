class Admin::TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "タグを追加しました。"
      redirect_to admin_tags_path
    else
      flash[:alret] = "項目を記入してください。"
      @tags = Tag.all
      render :index
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_tags_path
    else
      flash[:alret] = "項目を記入してください。"
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
