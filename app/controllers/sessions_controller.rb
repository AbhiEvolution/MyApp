class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    # debugger
    if @user
      if @user.unconfirmed?
        puts "You are not confirmed with 1"
        # debugger
        redirect_to new_confirmation_path, alert: "Incorrect email or password."
      else
        puts "You are not confirmed with 2"
        after_login_path = session[:user_return_to] || root_path
        active_session = login @user
        remember(active_session) if params[:user][:remember_me] == "1"
        redirect_to after_login_path, notice: "Signed in."
      end
    else
      puts "You are not confirmed with 2"
      # debugger
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget_active_session
    logout
    redirect_to root_path, notice: "Signed out."
  end

  def new
  end
end
