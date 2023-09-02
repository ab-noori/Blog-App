class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(author: current_user))
    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id), notice: 'Comment was successfully created'
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
