# frozen_string_literal: true

class UniqueIndexOnRatings < ActiveRecord::Migration
  def change
    add_index :rateitapp_ratings, [:user_id, :ratable_type, :ratable_id], unique: true, name: 'primary_composite_key_index'
  end
end
