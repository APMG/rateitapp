# frozen_string_literal: true
require_dependency 'rateitapp/application_controller'

module Rateitapp
  # Controller for actions involving Ratables.
  class RatablesController < ApplicationController
    def show
      ratables = params[:ratable_id].split(',').map do |ratable_id|
        Ratable.new params[:ratable_type], ratable_id
      end

      serialization = ActiveModelSerializers::SerializableResource.new(ratables)
      render json: serialization.to_json
    end
  end
end
