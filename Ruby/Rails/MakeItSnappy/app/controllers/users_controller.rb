class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_profile_parameters)
    if @user.save
      login @user
      flash[:success] = "Thanks for registering!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def user_profile_parameters
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
