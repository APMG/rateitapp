require_dependency "rateitapp/application_controller"

module Rateitapp
  class RateesController < ApplicationController
    def show
      ratee = Ratee.new params[:ratee_type], params[:ratee_id]
      serialization = ActiveModelSerializers::SerializableResource.new(ratee)
      render json: serialization.to_json
    end
  end
end
