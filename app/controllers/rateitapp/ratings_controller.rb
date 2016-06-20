# frozen_string_literal: true
require_dependency 'rateitapp/application_controller'

module Rateitapp
  # Controller for actions involving ratings.
  class RatingsController < ApplicationController
    def index
      ratings = Rating.where(ratable_type: params[:ratable_type], user_id: params[:user_id])
                      .page(params[:page]).per(params[:per_page])

      render json: ratings
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

      if Rateitapp.plugin_manager.valid?(rating) && rating.save
        render json: rating, status: 201
      else
        render json: rating, status: 400, serializer: ActiveModel::Serializer::ErrorSerializer
      end
    end

    private

    def rating_params
      params.permit(:user_id, :ratable_type, :ratable_id)
    end
  end
end
