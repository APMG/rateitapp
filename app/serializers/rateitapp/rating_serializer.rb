# frozen_string_literal: true
module Rateitapp
  class RatingSerializer < ActiveModel::Serializer
    attributes :value
    attributes :ratable_type
    attributes :ratable_id
    attributes :user_id
  end
end
