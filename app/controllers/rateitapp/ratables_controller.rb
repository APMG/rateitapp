# frozen_string_literal: true
require_dependency 'rateitapp/application_controller'

module Rateitapp
  # Controller for actions involving Ratables.
  class RatablesController < ApplicationController
    MAX_SHOW_REQUESTS = 500

    def show
      ratable_ids = params[:ratable_id].split(',').take(MAX_SHOW_REQUESTS)
      ratables = ratable_ids.map do |ratable_id|
        Ratable.new params[:ratable_type], ratable_id
      end

      render json: ratables
    end
  end
end
