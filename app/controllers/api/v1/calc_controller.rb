# frozen_string_literal: true

module Api
  module V1
    # API endpoint to handle equation requests
    class CalcController < ApiController
      before_action :http_authenticate, :set_account

      def equation
        service = CalcService.new(@user, params)
        result = service.call

        # The form should be inactive during the data calculation on the server side, i.e.
        # the user is not allowed to request another calculation if the previous one is not finished
        new_record = Record.find_by(id: result.record) if result.record.present?

        if result.success? && new_record.present?
          render json: RecordDecorator.new(new_record).to_calc
        elsif bad_request!(message: "Calc service failure. #{ result.errors.messages }")
        end
      end

      def user
        render json: UserSerializer.new(current_user).serialized_json
      end

      private

      def set_account
        user = User.find_by(username: params[:username])
        if User.find_by(username: params[:username]).present?
          @user = User.find_by(username: params[:username])
        elsif not_found!(message: 'Username not found')
        end
      end

      def equation_params
        params.permit(:a, :b, :cmd, :username)
      end

      def user_params
        params.permit(:a, :b, :cmd, :username)
      end

      def current_user
        @current_user ||= set_account
      end

      def http_authenticate
        true unless Rails.env == 'production' && params[:username].present?
      end
    end
  end
end