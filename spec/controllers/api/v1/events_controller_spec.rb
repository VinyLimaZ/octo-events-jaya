# frozen_string_literal: true

describe Api::V1::EventsController do
  describe 'GET #index' do
    let!(:event) { create_list(:event, 5) }
    let(:issue) { event.last.issue }

    it 'returns http success' do
      get :index, params: { id: issue.id }
      expect(response).to have_http_status(:success)
    end
  end
end
