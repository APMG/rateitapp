class MakeFieldsNotNull < ActiveRecord::Migration
  def change
    change_column_null :rateitapp_ratings, :rating, false
    change_column_null :rateitapp_ratings, :ratee_type, false
    change_column_null :rateitapp_ratings, :ratee_id, false
    change_column_null :rateitapp_ratings, :user_id, false
  end
end
