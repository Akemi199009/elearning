class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find_by(user_id: current_user, category_id: params[:category_id])
    @words = (@lesson.category.words - @lesson.words) #残り問題数
    if (@lesson.category.words - @lesson.words).empty?
      redirect_to @lesson
    else
      @answer = @lesson.answers.build
    end
  end


  def create
    @lesson = Lesson.find_by(user_id: current_user, category_id: params[:category_id])
    @answer = @lesson.answers.build(answers_params)
    if @answer.save
     @lesson.result = @lesson.choices.select { |choice| choice.correct?} .count
     @lesson.save
    redirect_to new_category_answer_path
    end
  end


  private
  def answers_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
  
end
