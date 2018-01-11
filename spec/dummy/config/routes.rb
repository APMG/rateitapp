# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rateitapp::Engine => '/'
end
