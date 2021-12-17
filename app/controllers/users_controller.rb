class UsersController < ApplicationController

  def show
    begin 
      @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Error: You have to be logged in or registered to access the dashboard"

      redirect_to root_path
    end

  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private
      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
end