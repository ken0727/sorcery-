class SessionsController < ApplicationController
  def new
    # ログインフォームを表示するためのアクション
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to posts_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'Logged out!'
  end
end
