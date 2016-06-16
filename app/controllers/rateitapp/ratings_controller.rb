require_dependency "rateitapp/application_controller"

module Rateitapp
  class RatingsController < ApplicationController
    def index
      render json: {}
    end

    def show
      ratings = params[:ratable_id].split(',').map do |ratable_id|
        Rating.find_by(ratable_type: params[:ratable_type], ratable_id: ratable_id, user_id: params[:user_id])
      end

      serialization = ActiveModelSerializers::SerializableResource.new(ratings)
      render json: serialization.to_json
    end

    def create
      rating = Rating.find_or_initialize_by(ratable_type: params[:ratable_type], ratable_id: params[:ratable_id], user_id: params[:user_id])
      rating.value = params[:value]

      if rating.save
        render json: { error: false }
      else
        render json: { error: true }
      end
    end

    private

    def rating_params
      params.permit(:user_id, :ratable_type, :ratable_id)
    end
  end
end
