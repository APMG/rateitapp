require_dependency "rateitapp/application_controller"

module Rateitapp
  class RateesController < ApplicationController
    def show
      ratees = params[:ratee_id].split(',').map do |ratee_id|
        Ratee.new params[:ratee_type], ratee_id
      end
      serialization = ActiveModelSerializers::SerializableResource.new(ratees)
      render json: serialization.to_json
    end
  end
end
