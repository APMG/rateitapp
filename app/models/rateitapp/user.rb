module Rateitapp
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
