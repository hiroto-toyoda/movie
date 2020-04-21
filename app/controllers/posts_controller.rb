class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :move_to_index, except: [:index, :show]
  # before_action :signed_in_user, only: [:show, :destroy]
  # before_action :correct_user,   only: [:show, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, nothice: '投稿しました'
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
    @posts = Post.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :index
    end
    # @group = Group.find(params[:id])
    # @post = post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :video).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
