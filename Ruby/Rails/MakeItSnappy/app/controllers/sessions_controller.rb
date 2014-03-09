class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:success] = "You are now logged in!"
      redirect_to root_url
    else
      flash.now[:error] = "Incorrect credentials!"
      render :new
    end
  end
end
