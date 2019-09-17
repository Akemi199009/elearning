module Admin
class WordsController < ApplicationController
before_action :admin_user
before_action :category_details, except: [:destroy]

def new
  @word = @category.words.build
  3.times {@word.choices.build}
end


def index
  @words = @category.words.paginate(page: params[:page], per_page: 10)
end


def edit
  @word = Word.find(params[:id])
end


def update
  @word = Word.find(params[:id])
  if @word.update_attributes(word_params)
    flash[:success] = "Edited the word."
    redirect_to admin_category_words_path
  else
    render "edit"
  end
end


def create
  @word = @category.words.build(word_params)
  if @word.save
    flash[:success] = "Create New Word!"
    redirect_to admin_category_words_path
  else
    render "new"
  end
  puts @word.errors.full_messages
end


def destroy
  @word = Word.find(params[:id])
  @word.destroy
  flash[:danger] = "Deleted Word."
  redirect_to admin_category_words_path
end





private
def admin_user
  unless current_user.admin?
    flash[:danger] = "User not authorized"
    redirect_to(root_url)
  end
end


def word_params
  params.require(:word).permit(
    :content, choices_attributes: [ :id, :content, :word_id, :correct]
  )
end

def category_details
  @category = Category.find(params[:category_id])
end



end
end