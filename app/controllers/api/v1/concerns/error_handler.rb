# frozen_string_literal: true

module Api
  module V1
    module Concerns
      # Error handling module for API
      module ErrorHandler
        extend ActiveSupport::Concern

        included do
          rescue_from ActiveRecord::RecordNotFound, with: :not_found
        end

        def respond_with_error!(message, status)
          #status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]

          render json: { error: { status: status, message: message } },
                 status: status
        end

        def bad_request!(message = 'Bad Request')
          respond_with_error!(message, 400,)
        end

        def not_found!(message = 'Not found!')
          respond_with_error!(message, 404)
        end

        def not_allowed!(message = 'Not allowed!')
          respond_with_error!(message, 405)
        end
      end
    end
  end
end
