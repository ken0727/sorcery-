class UsersController < ApplicationController
  def index
    @users = User.all # ユーザーの全てのレコードを取得します
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'ユーザーが作成されました。ログインしてください。'
    else
      flash.now[:alert] = 'User registration failed. Please check your input.'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
