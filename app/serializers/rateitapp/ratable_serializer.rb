# frozen_string_literal: true
module Rateitapp
  class RatableSerializer < ActiveModel::Serializer
    attributes :type
    attributes :id
    attributes :average
    attributes :count
  end
end
