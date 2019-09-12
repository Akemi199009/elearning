class RemovecategoriesIdFromwords < ActiveRecord::Migration[5.2]
  def change
    remove_column :words, :category_id, :integer
  end
end
