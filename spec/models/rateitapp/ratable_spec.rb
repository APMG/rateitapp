require 'rails_helper'

module Rateitapp
  RSpec.describe Ratable do
    let(:type) { 'jukebox_song' }
    let(:id) { 1234 }
    let(:ratable) { Ratable.new type, id }

    describe '#type' do
      subject { ratable.type }

      it { is_expected.to eq 'jukebox_song' }
    end

    describe '#id' do
      subject { ratable.id }

      it { is_expected.to eq '1234' }
    end

    describe '#count' do
      before :each do
        5.times do |i|
          create :rating, ratable_type: 'jukebox_song', ratable_id: 1234, value: i+1
        end
        create :rating, ratable_type: 'jukebox_stuff', ratable_id: 1235, value: 1
      end

      subject { ratable.count }

      it { is_expected.to eq 5 }
    end

    describe '#average' do
      before :each do
        6.times do |i|
          create :rating, ratable_type: 'jukebox_song', ratable_id: 1234, value: i+1
        end
        create :rating, ratable_type: 'jukebox_stuff', ratable_id: 1235, value: 1
      end

      subject { ratable.average }

      it { is_expected.to eq 3.5 }
    end
  end
end
