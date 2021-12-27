class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to action: :index
    else
      render template: "tags/index"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
