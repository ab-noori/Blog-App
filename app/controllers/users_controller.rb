class UsersController < DeviseController
  before_action :authenticate_user!

  def index
    if current_user
      @users = User.all.order(id: :asc)
    else
      redirect_to new_user_session_path
    end
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to new_user_session_path
    else
      @user = User.includes(:posts).find(params[:id])
    end
  end
end
