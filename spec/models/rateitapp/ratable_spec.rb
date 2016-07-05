# frozen_string_literal: true
require 'rails_helper'

module Rateitapp
  RSpec.describe Ratable do
    let(:type) { 'song' }
    let(:id) { 1234 }
    let(:ratable) { Ratable.new type, id }

    describe '#type' do
      subject { ratable.type }

      it { is_expected.to eq 'song' }
    end

    describe '#id' do
      subject { ratable.id }

      it { is_expected.to eq '1234' }
    end

    describe '#count' do
      before :each do
        5.times do |i|
          create :rating, ratable_type: 'song', ratable_id: 1234, value: i + 1
        end
        create :rating, ratable_type: 'other_stuff', ratable_id: 1235, value: 1
      end

      subject { ratable.count }

      it { is_expected.to eq 5 }
    end

    describe '#average' do
      before :each do
        4.times do |i|
          create :rating, ratable_type: 'song', ratable_id: 1234, value: i + 1
        end
        create :rating, ratable_type: 'other_stuff', ratable_id: 1235, value: 1
      end

      subject { ratable.average }

      it { is_expected.to eq 2.5 }

      # Rails encodes BigDecimal as a JSON string to avoid precision loss when
      # poorly behaved clients convert to float. Given the nature of this value,
      # the precision is superfluous and the string is annoying. So make this a
      # float.
      it { is_expected.to be_instance_of Float }
    end
  end
end
