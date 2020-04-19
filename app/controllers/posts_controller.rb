class PostsController < ApplicationController
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

  private
    def post_params
      params.require(:post).permit(:title, :body, :video)
    end
end
