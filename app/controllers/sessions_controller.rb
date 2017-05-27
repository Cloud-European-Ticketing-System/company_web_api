class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    if @user = Auth.new(login_params)
      session[:user] = @user
      redirect_to User.find(@user.id)
    end
  end

  def destroy
    if @user.destroy
      session[:user] = nil
      redirect_to root_path
    end
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
