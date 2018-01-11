# frozen_string_literal: true

module Rateitapp
  # Base controller class.
  class ApplicationController < ActionController::Base
    after_action :set_content_type

    protect_from_forgery with: :null_session

    ActiveModelSerializers.config.adapter = :json_api

    private

    def set_content_type
      self.content_type = 'application/vnd.api+json'
      # JSON API Spec states that there should be no media type parameters.
      response.charset = false
    end
  end
end
