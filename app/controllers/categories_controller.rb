class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)

    # if params[:status] == "learned"
    #   @categories = Lesson.joins(:user).find_by(user_id: current_user.id)
    #   @categories.paginate(page: params[:page], per_page: 6)
    # elsif params[:status] == "anlearned"
    #   @categories = Category.find_by(id: 2)
    # else

    # end
end



end
