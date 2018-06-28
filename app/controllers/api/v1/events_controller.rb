# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      def index
        events = Issue.find(params[:id]).events.order(created_at: :desc)
        render json: events, status: :ok
      end
    end
  end
end
