class CreateRateitappRatings < ActiveRecord::Migration
  def change
    create_table :rateitapp_ratings do |t|
      t.integer :rating
      t.string :ratee_type
      t.string :ratee_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
