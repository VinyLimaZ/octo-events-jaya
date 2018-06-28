# frozen_string_literal: true

describe Issue do
  context '.find_or_create_by' do
    let(:issue_params) { attributes_for(:issue) }

    subject! { described_class.find_or_create_by(issue_params) }

    it 'a issue with success' do
      expect(subject).to be_persisted
      expect(described_class.count).to be 1
    end

    let(:issue_two) { build(:issue, issue_params) }
    let(:issue_two_errors) { issue_two.errors.full_messages.first }
    let(:error_message) do
      I18n.t('activerecord.errors.models.issue.attributes.number.taken')
    end

    it 'doesnt create a issue with same number of other' do
      expect(issue_two.save).to be false
      expect(issue_two_errors).to include error_message
    end
  end
end
