class YoutuberController < ApplicationController
    def index
        @youtubers = youtuber.page(params[:page]).per(10)
        @tag_list=Tag.all
    end
end
