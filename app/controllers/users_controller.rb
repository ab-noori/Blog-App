class UsersController < DeviseController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
