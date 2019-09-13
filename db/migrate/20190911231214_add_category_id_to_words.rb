class AddCategoryIdToWords < ActiveRecord::Migration[5.2]
  def change
    add_reference :words, :category, foreign_key: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
