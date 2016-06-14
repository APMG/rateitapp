module Rateitapp
  class RateeSerializer < ActiveModel::Serializer
    attributes :type
    attributes :id
    attributes :average
    attributes :count
  end
end
