# frozen_string_literal: true
module Rateitapp
  # Base controller class.
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # ActiveModelSerializers.config.adapter = :json_api
  end
end
