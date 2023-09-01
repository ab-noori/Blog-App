class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = User.includes(posts: [:author]).find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_post_path(user_id: @current_user.id, id: @post.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
