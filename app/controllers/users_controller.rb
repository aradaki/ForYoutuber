class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def mypage
    @user = current_user
    render template: "users/show"
  end
end
