class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
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
  end

  def show
  end

  def destroy
    redirect_to root_path, notice: '削除しました' if @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :video)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
