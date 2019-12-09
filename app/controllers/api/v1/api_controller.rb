# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      include ActionController::Helpers

      include Api::V1::Concerns::ErrorHandler
    end
  end
end