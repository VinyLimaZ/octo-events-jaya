class Issue < ApplicationRecord
  has_many :events

  validates_uniqueness_of :number

  def state=(event_class = Event, state)
    event_class.create(action: state, issue: self)
  end
end
