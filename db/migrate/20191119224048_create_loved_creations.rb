class CreateLovedCreations < ActiveRecord::Migration[6.0]
  def change
    create_table :loved_creations do |t|
      t.integer :user_id
      t.integer :creation_id

      t.timestamps
    end
  end
end
