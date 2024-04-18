class User::LoginController < ApplicationController
  layout "login"
  before_action :redirect_if_authenticated, only: [:login]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email].downcase)
    if @user
      if @user.authenticate(params[:user][:password])
        login @user
        remember(@user) if params[:user][:remember_me] == "1"
        redirect_to root_path
      else
        flash.now[:alert] = 'Incorrect Password.'
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'Incorrect Email or Password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget(current_user) if cookies[:remember_token].present?
    logout
    redirect_to root_path, alert: "Logged out"
  end
end
