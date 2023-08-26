class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: @current_user)

    respond_to do |format|
      if @like.save
        format.html do
          redirect_to user_post_path(user_id: @current_user.id, id: @post.id), notice: 'Like was successfully added.'
        end
      else
        format.html do
          redirect_to user_post_path(user_id: @current_user.id, id: @post.id), alert: 'Failed to add like.'
        end
      end
    end
  end
end
