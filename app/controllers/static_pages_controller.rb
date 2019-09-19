class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = Activity.paginate(page: params[:page], per_page: 8)

      render 'users/home_feed'
    end
  end
end
