# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'ContentTypes', type: :request do
  describe 'handles JSON API Media Type correctly' do
    before :each do
      6.times { create :rating, ratable_type: 'song', ratable_id: 11 }
    end

    it 'returns a value conforming to the spec' do
      get '/ratables/song/11'
      expect(response).to have_http_status(200)

      # Should have media type with no parameters.
      expect(response['Content-Type']).to eq 'application/vnd.api+json'
    end
  end
end
