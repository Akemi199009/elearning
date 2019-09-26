module CategoriesHelper

  def active_page
    if params[:status] == @page
       'active'
    end
  end





end
