# frozen_string_literal: true
module Rateitapp
  # Base controller class.
  class ApplicationController < ActionController::Base
    after_filter :set_content_type

    protect_from_forgery with: :exception

    ActiveModelSerializers.config.adapter = :json_api

    private

    def set_content_type
      self.content_type = 'application/vnd.api+json'
    end
  end
end
