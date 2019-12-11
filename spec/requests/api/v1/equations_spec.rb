# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Equations', type: :request do
  describe 'POST /api/v1/equation' do
    it 'returns a result' do
      user = create(:user)
      request_params = { a: 1, b: 2, cmd: '+', username: user.username }

      post '/api/v1/equation', params: request_params

      aggregate_failures 'testing response' do
        expect(response).to have_http_status(200)
        expect(json).to match_array([['count', 1],
                                     ['formula', '1 + 2'],
                                     ['id', Record.last.id],
                                     %w[result 3]])
      end
    end
  end

  describe 'Invalid data' do
    it 'in case of invalid data' do
      request_params = { a: 1, b: 2 }

      post '/api/v1/equation', params: request_params

      aggregate_failures 'provided “error” text should be returned' do
        expect(response).to have_http_status(400)
        expect(json).to include('error')
      end
    end

    it 'all calculations previously made should be stored in the database' do
      user = create(:user)
      3.times { create(:record, user: user) }

      expect(Record.count).to eq 3
    end
  end
end
