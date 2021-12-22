class TagsController < ApplicationController
  def index
    @tag_list=Tag.all
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      @tag_list = Tag.all
      render :index
    end
  end
  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
