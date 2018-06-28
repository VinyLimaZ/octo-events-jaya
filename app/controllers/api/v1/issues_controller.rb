# frozen_string_literal: true

module Api
  module V1
    class IssuesController < ApplicationController
      before_action :verify_github_webhook_token, only: :create

      def create
        reply_ping and return if ping?

        issue = Issue.find_or_create_by(issue_params)
        issue.events.create(event_params)

        render json: { message: :ok }, status: :created
      end

      def statistics
        statistic = EventStatistic.call
        render json: statistic, status: :ok
      end

      def reply_ping
        render json: { message: 'I catch your ping' }, status: :ok
      end

      private

      def ping?
        request.headers.env['HTTP_X_GITHUB_EVENT'].eql? 'ping'
      end

      def issue_params
        params.require(:issue).permit(
          :number,
          :state,
          :title,
          :body,
          :url
        )
      end

      def event_params
        { action: JSON.parse(request.body.read).dig('action') }
      end
    end
  end
end
