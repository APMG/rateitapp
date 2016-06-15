require 'rails_helper'

module Rateitapp
  RSpec.describe Rating, type: :model do
    it 'works' do
      rating = Rating.new value: 5, ratable_type: 'playlist', ratable_id: 12345, user_id: 1234
      expect(rating).to be_valid
    end
  end
end
