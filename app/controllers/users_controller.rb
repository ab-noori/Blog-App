class UsersController < DeviseController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to users_path
    else
      @user = User.includes(:posts).find(params[:id])
    end
  end
end
