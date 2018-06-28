describe IssuesController do
  before do
    allow_any_instance_of(GithubTokenAuth)
      .to receive(:verify_github_webhook_token)
      .and_return(nil)
    allow(JSON).to receive(:parse).and_return({})
    allow_any_instance_of(Hash).to receive(:dig).with('action').and_return('opened')
  end

  describe 'POST #create' do
    let(:issue_params) { attributes_for(:issue) }
    let(:success_message) { { 'message': 'ok' }.to_json }

    it 'create a new Issue' do
      post :create, params: { issue: issue_params }

      expect(response.status).to be 201
      expect(response.body).to eq success_message
      expect(Issue.count).to eq 1
      expect(Issue.last.events.count).to eq 1
    end

    context '#find' do
      let(:issue) { create(:issue) }
      let!(:event) { create(:event, issue: issue, action: 'closed') }
      let(:issue_params) { issue.attributes }

      it 'finds a previously created Issue and add a new event' do
        post :create, params: { issue: issue_params }

        expect(response.status).to be 201
        expect(Issue.count).to eq 1
        expect(issue.events.count).to eq 2
      end
    end
  end
end
