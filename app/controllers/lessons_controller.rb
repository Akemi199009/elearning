class LessonsController < ApplicationController

  def create
    category = Category.find(params[:category_id])
    lesson = category.lessons.build(user_id: current_user.id)
    if lesson.save
    redirect_to new_category_answer_path(category)
    else
      render categories
    end
  end

  

  def show
    @lesson = Lesson.find(params[:id])


  end





end
