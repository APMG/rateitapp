class ChangeDataTypeForUserId < ActiveRecord::Migration
  def change
    change_column :rateitapp_ratings, :user_id, :string
  end
end
