class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if params[:status] == "words"
        @answers = Answer.joins(:lesson).where(lessons: {user_id: current_user}).paginate(page: params[:page], per_page: 8)
        @categories = Category.joins(:lessons).where(lessons: {user_id: current_user})
        if params[:status] == "words" && params[:category_id]
        @answers = Answer.joins(:lesson).where(lessons: {category_id: params[:category_id]})
        end
      else
      @activities = Activity.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
      @answers = Answer.joins(:lesson).where(lessons: {user_id: current_user})
      end
      render 'users/home_feed'
    end
  end


end
