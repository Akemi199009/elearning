class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:info] = "Success fully login!"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email or password combination!"
      render "new"
    end
  end

  
end
