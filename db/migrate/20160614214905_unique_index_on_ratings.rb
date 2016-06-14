class UniqueIndexOnRatings < ActiveRecord::Migration
  def change
    add_index :rateitapp_ratings, [:user_id, :ratee_type, :ratee_id], unique: true
  end
end
