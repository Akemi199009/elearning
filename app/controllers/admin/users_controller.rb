module Admin
  class UsersController < ApplicationController
    before_action :admin_user


    def index
      @users = User.paginate(page: params[:page], per_page: 6)
    end

    def update
      user = User.find(params[:id])
      if user.admin?
        user.update(admin: false)
      else
         user.update(admin: true)
      end
      redirect_to admin_users_path
    end

    

private
    def admin_user
      unless current_user.admin?
        flash[:danger] = "User not authorized"
        redirect_to(root_url)
      end
    end
  
  
  end
end
  