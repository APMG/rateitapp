require_dependency "rateitapp/application_controller"

module Rateitapp
  class RatingsController < ApplicationController
    def create
      rating = Rating.find_or_initialize_by(ratable_type: params[:ratable_type], ratable_id: params[:ratable_id], user_id: params[:user_id])
      rating.value = params[:value]

      if rating.save
        render json: { error: false }
      else
        render json: { error: true }
      end
    end
  end
end
