# frozen_string_literal: true
require 'rails_helper'

module Rateitapp
  RSpec.describe User do
    let(:user_id) { 3 }
    let(:user) { User.new user_id }

    describe '#id' do
      subject { user.id }

      it { is_expected.to eq user_id }
    end

    describe '#ratings' do
      subject { user.ratings }

      before :each do
        create :song_rating, user_id: user_id, value: 1
        create :song_rating, user_id: user_id, value: 2
        create :song_rating, user_id: user_id, value: 3
        create :song_rating, user_id: user_id, value: 4

        create :rating, user_id: user_id, value: 4

        # A rating for a different user.
        create :song_rating, user_id: 2, value: 4
      end

      it 'returns five items' do
        expect(subject.count).to eq 5
      end

      it 'allows additional parameters' do
        expect(subject.where(ratable_type: 'jukebox_song').count).to eq 4
      end
    end
  end
end
