# frozen_string_literal: true

class EventStatistic
  ACTION_TYPES = %w[opened closed reopened].freeze

  def self.call
    new.call
  end

  def call
    parse_info
  end

  private

  def parse_info
    info_parsed = {}

    ACTION_TYPES.each do |action|
      info_parsed.merge!("#{action}": Event.send(action).count)
    end

    info_parsed
  end
end
