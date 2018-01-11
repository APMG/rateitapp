# frozen_string_literal: true

require 'rails_helper'

module Rateitapp
  RSpec.describe OauthPlugin do
    describe '#validate_access_token' do
      let(:oauth_plugin) { OauthPlugin.new }
      let(:access_token) { '3123123123123123123123123123123123123123' }
      let(:uid) { '123abc123abc' }

      before(:each) do
        stub_request(:get, 'https://provider.example.com/oauth/token/info')
          .with(headers: {
                  'Authorization': "Bearer #{access_token}",
                  'Host': 'provider.example.com'
                })
          .to_return(status: 200,
                     body: {
                       'uid': uid,
                       'role': 'admin',
                       'expires_at': "\u0004\bI\"\u001e2032-12-18 12:31:19 -0600\u0006:\rencoding\"\u000fISO-8859-1"
                     }.to_json,
                     headers: {})

        stub_request(:get, 'https://provider.example.com/oauth/token/info')
          .with(headers: {
                  'Authorization' => 'Bearer 1231231231231231231231231231231231231231',
                  'Host' => 'provider.example.com'
                })
          .to_return(status: 401, body: '', headers: {})
      end

      subject { oauth_plugin.validate_access_token(access_token) }

      context 'with an authorized access token' do
        it { is_expected.to be_valid }
        it 'has expected response uid' do
          expect(subject.uid).to eq uid
        end
      end

      context 'with an unauthorized access token' do
        let(:access_token) { '1231231231231231231231231231231231231231' }

        it 'is invalid' do
          expect(subject.valid?).to eq false
        end
        it 'has no response uid' do
          expect(subject.uid).to eq nil
        end
      end
    end
  end
end
