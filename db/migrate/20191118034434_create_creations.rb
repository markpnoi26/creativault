class CreateCreations < ActiveRecord::Migration[6.0]
  def change
    create_table :creations do |t|
      t.string :title
      t.string :description
      t.integer :heart_count
      t.integer :flag_count
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
