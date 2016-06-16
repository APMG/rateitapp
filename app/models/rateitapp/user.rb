# frozen_string_literal: true
module Rateitapp
  # A user who has rated.
  class User
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def ratings
      Rating.where(user_id: id)
    end
  end
end
