class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
    render 'static_pages/home'
  end

  def create
    if @user = User.first #Auth.create(login_params)
      session[:user] = @user
      redirect_to User.find(@user.id), notice: 'Login successful'
    else
      render 'static_pages/home', notice: 'Login failed'
    end
  end

  def destroy
    # if @user.destroy
      session[:user] = nil
      redirect_to root_path
    # end
  end

  private

  def login_params
    params.require(:auth).permit(:email, :password)
  end
end
