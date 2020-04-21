class UsersController < ApplicationController
  before_action :correct_user,   only: [:show, :destroy]

  def destroy
  end

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
