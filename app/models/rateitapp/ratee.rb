module Rateitapp
  class Ratee
    attr_reader :type, :id

    def initialize(type, id)
      @type = type.to_s
      @id = id.to_s
    end

    def average
      Rating.where(ratee_type: @type, ratee_id: @id).average(:rating)
    end

    def count
      Rating.where(ratee_type: @type, ratee_id: @id).count
    end

    private

    # ActiveModelSerializers change.
    alias :read_attribute_for_serialization :public_send
  end
end
