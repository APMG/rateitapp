# frozen_string_literal: true
class MakeFieldsNotNull < ActiveRecord::Migration
  def change
    change_column_null :rateitapp_ratings, :value, false
    change_column_null :rateitapp_ratings, :ratable_type, false
    change_column_null :rateitapp_ratings, :ratable_id, false
    change_column_null :rateitapp_ratings, :user_id, false
  end
end
