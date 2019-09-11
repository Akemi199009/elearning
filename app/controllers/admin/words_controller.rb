module Admin
class WordsController < ApplicationController
brefore_action :admin_user













private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
end