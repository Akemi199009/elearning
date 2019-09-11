module Admin
class CategoriesController < ApplicationController
  before_action :admin_user, expect: [:show]
  def index
    @categories = Categorie.paginate(page: params[:page], per_page: 10)
  end

  def new
    @categorie = Categorie.new
  end

  def edit
    @categorie = Categorie.find(params[:id])
  end
  

  def create
    categorie = Categorie.new(categorie_params)
    if categorie.save
       flash[:success] = "Created a category."    
       redirect_to admin_categories_path
    else
        render "new"
    end
  end

  def update
    @categorie = Categorie.find_by(params[:id])
    if @categorie.update_attributes(categorie_params)
      flash[:success] = "Edited the category."
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @categorie = Categorie.find(params[:id])
    @categorie.destroy
    flash[:info] = "Category deleted."
    redirect_to admin_categories_path
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def categorie_params
      params.require(:categorie).permit(:title, :description)
    end


end
end

