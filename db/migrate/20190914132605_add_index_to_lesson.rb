class AddIndexToLesson < ActiveRecord::Migration[5.2]
  def change
    add_index :lessons, [:user_id, :category_id], unique: true
  end
end
