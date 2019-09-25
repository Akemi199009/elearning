class CategoriesController < ApplicationController

  def index

    if params[:status] == "learned"
      @categories = Category.joins(:lessons).where(lessons: {user_id: current_user.id}).paginate(page: params[:page], per_page: 6)
    # elsif params[:status] == "anlearned"
    #   @categories = Category.joins(WHERE NOT 'lessons'.'user_id' = 'current_user.id';).where(lessons: {result: nil}).paginate(page: params[:page], per_page: 6)
    else
      @categories = Category.paginate(page: params[:page], per_page: 6)
    end
end



end
