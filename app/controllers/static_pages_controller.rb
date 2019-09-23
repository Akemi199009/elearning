class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = Activity.order(created_at: :desc).paginate(page: params[:page], per_page: 8)

      render 'users/home_feed'
    end
  end
end
