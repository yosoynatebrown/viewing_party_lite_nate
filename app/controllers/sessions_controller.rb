class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password]) && @user.role == 'default'
      session[:user_id] = @user.id
      render "users/show"
    elsif @user.authenticate(params[:password]) && @user.role == 'admin'
      session[:user_id] = @user.id
      redirect_to admin_dashboard_path
    else
      redirect_to "/login"
      flash[:alert] = "Error: Authentication failed"
    end
  end

  def destroy
    session.destroy

    redirect_to "/"
  end
end