module Rateitapp
  class Ratable
    attr_reader :type, :id

    def initialize(type, id)
      @type = type.to_s
      @id = id.to_s
    end

    def average
      Rating.where(ratable_type: @type, ratable_id: @id).average(:value)
    end

    def count
      Rating.where(ratable_type: @type, ratable_id: @id).count
    end

    private

    # ActiveModelSerializers change.
    alias :read_attribute_for_serialization :public_send
  end
end
