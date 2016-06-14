require 'rails_helper'

module Rateitapp
  RSpec.describe Ratee do
    let(:type) { 'jukebox_song' }
    let(:id) { 1234 }
    let(:ratee) { Ratee.new type, id }

    describe '#type' do
      subject { ratee.type }

      it { is_expected.to eq 'jukebox_song' }
    end

    describe '#id' do
      subject { ratee.id }

      it { is_expected.to eq '1234' }
    end

    describe '#count' do
      before :each do
        5.times do |i|
          create :rating, ratee_type: 'jukebox_song', ratee_id: 1234, rating: i+1
        end
        create :rating, ratee_type: 'jukebox_stuff', ratee_id: 1235, rating: 1
      end

      subject { ratee.count }

      it { is_expected.to eq 5 }
    end

    describe '#average' do
      before :each do
        6.times do |i|
          create :rating, ratee_type: 'jukebox_song', ratee_id: 1234, rating: i+1
        end
        create :rating, ratee_type: 'jukebox_stuff', ratee_id: 1235, rating: 1
      end

      subject { ratee.average }

      it { is_expected.to eq 3.5 }
    end
  end
end
