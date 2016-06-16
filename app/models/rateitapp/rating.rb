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
  class Rating < ActiveRecord::Base
  end
end
