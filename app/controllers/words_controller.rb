class WordsController < ApplicationController


def index
  @categories = Category.joins(:lessons).where(lessons: {user_id: current_user})
  if params[:status].present?
    @answers = Answer.joins(:lesson).where(lessons: {category_id: params[:status]}).paginate(page: params[:page], per_page: 8)
  else
    @answers = Answer.joins(:lesson).where(lessons: {user_id: current_user}).paginate(page: params[:page], per_page: 8)
  end
end

end
