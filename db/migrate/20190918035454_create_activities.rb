class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.string :action_type
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :activities, [:action_id, :action_type]
  end
end
