module Admin
class CategoriesController < ApplicationController
  before_action :admin_user 
  before_action :category_details, only: [:edit, :update, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def edit
  end
  

  def create
    @category = Category.new(category_params)
    if @category.save
       flash[:success] = "Created a category."    
       redirect_to admin_categories_path
    else
        render "new"
    end
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Edited the category."
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:info] = "Category deleted."
    redirect_to admin_categories_path
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end

    def category_details
        @category = Category.find(params[:id])
    end


end
end

