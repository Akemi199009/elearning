class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :following, :follwers]
  before_action :correct_user, only: [:update, :edit]


  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end


  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome to the Elearning System!"
      redirect_to root_url  
    else
      render "new"
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) #カラムを全部更新するためには　attributes
      flash[:success] = "Editing was successful."
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end


def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.following.paginate(page: params[:page], per_page: 5)
  render 'show_follow'
end

def followers
  @title = "Followers"
  @user = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page], per_page: 5)
  render 'show_follow'
end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def logged_in_user
    unless logged_in? 
      flash[:info] = "Please login."
      redirect_to login_path
    end
  end


  def correct_user #正しいユーザーか確認する
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:danger] = "User not authorized"
      redirect_to(root_url)
    end
  end

end
