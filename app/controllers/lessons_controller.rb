class LessonsController < ApplicationController
  before_action :destroy, only: [:create]

  def create
    category = Category.find(params[:category_id])
     lesson = category.lessons.build(user_id: current_user.id)
      if lesson.save
        redirect_to new_category_answer_path(category)
      end
  end

  

  def show
    @lesson = Lesson.find(params[:id])
  end

 def destroy
  category = Category.find(params[:category_id])
  if @lesson = Lesson.find_by(user_id: current_user, category_id: category)
     @lesson.destroy
  end
 end


end
