# class CommentsController < ApplicationController
#   def create
#     @comment = Comment.create(comment_params)
#     redirect_to "/posts/#{comment.post.id}"
#   end

#   private
#   def comment_params
#     params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
#   end
# end


# class CommentsController < ApplicationController
#   def create
#     comment = Comment.create(comment_params)
#     redirect_to "/posts/#{comment.post.id}" 
#     # @comment = Comment.create(comment_params)
#     # respond_to do |format|
#     #   format.html { redirect_to post_path(params[:post_id])  }
#     #   format.json
#     # end
#   end

#   private
#   def comment_params
#     params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
#   end
# end
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
