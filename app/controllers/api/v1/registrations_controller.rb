# frozen_string_literal: true

module Api
  module V1
    # API endpoint to handle equation requests
    class RegistrationsController < ApiController
      def sign_up
        user = User.new(username: params[:username])

        if username_ok?(params[:username]) && user.valid?
          user = User.new(username: params[:username])
          user.save!
          render json: UserSerializer.new(user).serialized_json
        elsif not_allowed!(message: "Username is present. #{user.errors.full_messages.join(', ')}")
        end
      end

      def username_ok?(username)
        User.find_by(username: username).nil?
      end

      private

      def user_params
        params.permit(:username)
      end
    end
  end
end