class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :authenticate

  def current_user
    session[:user]
  end

  private

  def authenticate
    redirect_to root_path unless current_user
  end

  def add_token
    ApplicationResource.headers[:user_token] = session[:user]['token'] if current_user
  end
end
