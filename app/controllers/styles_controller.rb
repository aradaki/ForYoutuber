class StylesController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    # タグの一覧表示
    if params[:tag]
      @styles = Style.tagged_with(params[:tag])
      # タグ検索時にそのタグずけしているものを表示
    else
      @styles = Style.all
    end
  end
  def new
    @style = Style.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @style = Youtuber.tagged_with(params[:id])
  end

  def create
    @style = Style.new(style_params)
    @style.user_id = current_user.id
    if @style.save
      flash[:notice] = "スタイルを登録しました"
      redirect_to style_path(@style.id)
    else
      @tags = ActsAsTaggableOn::Tag.all
      render :new
    end
  end
# update・destroyは同じような形なので省略します
  private

    def style_params
      params.require(:style).permit(:name, :user_id, :image, tag_list: [])
      #  tag_list: []　を追記
    end

end
