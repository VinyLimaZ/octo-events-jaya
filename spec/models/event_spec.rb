require 'rails_helper'

describe Event, type: :model do
  context '.create' do
    let(:event_valid) { build(:event) }
    it 'with success' do
      expect(event_valid.save).to be true
      expect(event_valid).to be_persisted
    end

    let(:event) { build(:event, action: 'milestoned') }
    let(:error_message) do
      "event #{I18n.t('activerecord.errors.models.event.attributes.action.inclusion')}"
    end

    it 'cant create if action is not one of allowed' do
      expect(event.save).to be false
      expect(event.errors.full_messages).to include error_message
    end
  end
end
