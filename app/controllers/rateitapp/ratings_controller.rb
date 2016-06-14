require_dependency "rateitapp/application_controller"

module Rateitapp
  class RatingsController < ApplicationController
    def create
      rating = Rating.find_or_initialize_by(ratee_type: params[:ratee_type], ratee_id: params[:ratee_id])
      rating.rating = params[:rating]
      
      if rating.save
        render json: { error: false }
      else
        render json: { error: true }
      end
    end
  end
end
