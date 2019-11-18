class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :header
      t.string :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
