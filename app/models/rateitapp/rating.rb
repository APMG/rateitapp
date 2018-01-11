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

module Rateitapp
  # A rating uniquely identified by a user and ratable.
  class Rating < ActiveRecord::Base
    validates :value, presence: true
    validates :ratable_type, presence: true
    validates :ratable_id, presence: true
    validates :user_id, presence: true
    validates :value, inclusion: { in: 1..5, message: "can't be outside range" }
  end
end
