# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    events = Issue.find(params[:id]).events.order(created_at: :desc)
    render json: events, status: :ok
  end
end
