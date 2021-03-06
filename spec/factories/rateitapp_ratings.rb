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

FactoryGirl.define do
  factory :rateitapp_rating, class: 'Rateitapp::Rating' do
    factory :rating do
      sequence(:user_id) { |i| i }
      sequence(:ratable_type) { |i| "thing_type_#{i}" }
      sequence(:ratable_id) { |i| i }

      value 3

      factory :song_rating do
        ratable_type 'song'
      end
    end
  end
end
