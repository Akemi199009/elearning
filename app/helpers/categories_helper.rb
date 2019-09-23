module CategoriesHelper

  def active_page
    if params[:status] == @page
      return active
    end
  end



end
