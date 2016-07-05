# frozen_string_literal: true
require 'rails_helper'
require 'immutable-struct'

module Rateitapp
  # A plugin for the OAuth.
  class OauthPlugin
    Response = ImmutableStruct.new(:valid?, :uid)

    def validate_access_token(access_token)
      # Form request
      uri = URI("https://#{Rateitapp.provider_domain}/oauth/token/info")
      req = Net::HTTP::Get.new(uri)
      req['Authorization'] = "Bearer #{access_token}"

      # Get response
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }

      if res.is_a?(Net::HTTPSuccess)
        res_body = JSON.parse(res.body)
        Response.new(valid: true, uid: res_body['uid'])
      else
        Response.new(valid: false, uid: nil)
      end
    end
  end
end
