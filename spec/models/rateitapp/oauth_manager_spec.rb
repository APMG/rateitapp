# frozen_string_literal: true
require 'rails_helper'

module Rateitapp
  RSpec.describe OauthPlugin do
    describe '#validate_access_token' do
      let(:oauth_plugin) { OauthPlugin.new }
      let(:access_token) { '0a9aaeb432c0a270835438195281328f75078ed0' }

      before(:each) do
        stub_request(:get, 'https://accounts.publicradio.org/oauth/token/info')
          .with(headers: {
                  'Authorization': 'Bearer 0a9aaeb432c0a270835438195281328f75078ed0',
                  'Host': 'accounts.publicradio.org'
                })
          .to_return(status: 200,
                     body: {
                       'uid': '0a9aaeb432c0a270835438195281328f75078ed0',
                       'role': 'admin',
                       'expires_at': "\u0004\bI\"\u001e2032-12-18 12:31:19 -0600\u0006:\rencoding\"\u000fISO-8859-1"
                     }.to_json,
                     headers: {})

        stub_request(:get, 'https://accounts.publicradio.org/oauth/token/info')
          .with(headers: {
                  'Authorization' => 'Bearer 1231231231231231231231231231231231231231',
                  'Host' => 'accounts.publicradio.org'
                })
          .to_return(status: 401, body: '', headers: {})
      end

      subject { oauth_plugin.validate_access_token(access_token) }

      context 'with an authorized access token' do
        it { is_expected.to be_valid }
        it 'has expected response uid' do
          expect(subject.uid).to eq access_token
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
