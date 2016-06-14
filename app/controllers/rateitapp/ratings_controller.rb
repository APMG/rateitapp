require_dependency "rateitapp/application_controller"

module Rateitapp
  class RatingsController < ApplicationController
    def create
      rating = Rating.new rating_params

      if rating.save
        render json: { error: false }
      else
        render json: { error: true }
      end
    end

    private

    def rating_params
      params.permit(:rating, :ratee_id)
    end
  end
end
