# frozen_string_literal: true
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
      rating = Rating.new value: 5, ratable_type: 'playlist', ratable_id: 12_345, user_id: 1234
      expect(rating).to be_valid
    end

    describe '#value' do
      it 'cannot be blank' do
        rating = build :rating, value: nil
        expect(rating).to_not be_valid
        expect(rating.errors[:value]).to eq ["can't be blank", "can't be outside range"]
      end

      it 'cannot be outside validated range' do
        rating = build :rating, value: 100
        expect(rating).to_not be_valid
        expect(rating.errors[:value]).to eq ["can't be outside range"]
      end
    end

    describe '#ratable_type' do
      it 'cannot be blank' do
        rating = build :rating, ratable_type: nil
        expect(rating).to_not be_valid
        expect(rating.errors[:ratable_type]).to eq ["can't be blank"]
      end
    end

    describe '#ratable_id' do
      it 'cannot be blank' do
        rating = build :rating, ratable_id: nil
        expect(rating).to_not be_valid
        expect(rating.errors[:ratable_id]).to eq ["can't be blank"]
      end
    end

    describe '#user_id' do
      it 'cannot be blank' do
        rating = build :rating, user_id: nil
        expect(rating).to_not be_valid
        expect(rating.errors[:user_id]).to eq ["can't be blank"]
      end
    end
  end
end
