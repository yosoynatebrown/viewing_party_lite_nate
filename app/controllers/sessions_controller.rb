class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email]).authenticate(params[:password])
      session[:user_id] = @user.id
      render "users/show"
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