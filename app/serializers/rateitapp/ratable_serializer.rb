# frozen_string_literal: true

module Rateitapp
  # The serializer for a ratable.
  class RatableSerializer < ActiveModel::Serializer
    attributes :type
    attributes :id
    attributes :average
    attributes :count
  end
end
