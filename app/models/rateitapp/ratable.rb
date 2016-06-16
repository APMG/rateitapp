# frozen_string_literal: true
module Rateitapp
  # The thing being rated.
  class Ratable
    attr_reader :type, :id

    def initialize(type, id)
      @type = type.to_s
      @id = id.to_s
    end

    def average
      Rating.where(ratable_type: @type, ratable_id: @id).average(:value).to_f
    end

    def count
      Rating.where(ratable_type: @type, ratable_id: @id).count
    end

    # ActiveModelSerializers change.
    alias read_attribute_for_serialization public_send
  end
end
