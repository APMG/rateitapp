module Rateitapp
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # ActiveModelSerializers.config.adapter = :json_api
  end
end
