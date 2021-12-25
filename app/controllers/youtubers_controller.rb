class YoutubersController < ApplicationController
  before_action :set_youtuber, only: %i[ show edit update destroy ]

  # GET /youtubers or /youtubers.json
  def index

    @youtubers = Youtuber.all
    @page = Youtuber.all.page(params[:page]).per(10)
  end

  # GET /youtubers/1 or /youtubers/1.json
  def show
    @youtuber = Youtuber.find(params[:id])
    #@youtuber_tags = @youtuber.tags
    @comments = @youtuber.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  # GET /youtubers/new
  def new
    @youtuber = Youtuber.new
  end

  # GET /youtubers/1/edit
  def edit
  end

  # POST /youtubers or /youtubers.json
  def create
    @youtuber = Youtuber.new(youtuber_params)
    @youtuber.user_id=current_user.id
    # 受け取った値を,で区切って配列にする
    # tag_list=params[:youtuber][:name].split(',')
    @youtuber.tag_diff(params[:youtuber][:tag])
    if @youtuber.save
      # @youtuber.save_tag(tag_list)
      redirect_to youtubers_path, notice:'投稿完了しました:)'
    else
      render:new
    end
  end

  # PATCH/PUT /youtubers/1 or /youtubers/1.json
  def update
    respond_to do |format|
      if @youtuber.update(youtuber_params)
        format.html { redirect_to @youtuber, notice: "Youtuber was successfully updated." }
        format.json { render :show, status: :ok, location: @youtuber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @youtuber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubers/1 or /youtubers/1.json
  def destroy
    @youtuber.destroy
    respond_to do |format|
      format.html { redirect_to youtubers_url, notice: "Youtuber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    # キーワード検索
    @search = Youtuber.ransack(params[:q])
    @results = @search.result.order("created_at DESC").page(params[:page]).per(10)
    # タグ検索
    @tag_search = Youtuber.tagged_with(params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtuber
      @youtuber = Youtuber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def youtuber_params
      params.require(:youtuber).permit(:name, :image_id, :introduction)
    end
end
