# == Schema Information
#
# Table name: rateitapp_ratings
#
#  id           :integer          not null, primary key
#  value        :integer          not null
#  ratable_type :string(255)      not null
#  ratable_id   :string(255)      not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

module Rateitapp
  RSpec.describe Rating, type: :model do
    it 'works' do
      rating = Rating.new value: 5, ratable_type: 'playlist', ratable_id: 12345, user_id: 1234
      expect(rating).to be_valid
    end
  end
end
