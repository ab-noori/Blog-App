class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: @current_user)
    redirect_to user_post_path(user_id: @current_user.id, id: @post.id)
  end
end
