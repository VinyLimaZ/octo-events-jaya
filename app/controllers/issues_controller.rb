class IssuesController < ApplicationController
  before_action :verify_github_webhook_token, only: :create

  def create
    Issue.find_or_create_by(issue_params)
    render json: { message: :ok }, status: :created
  end

  private

  def issue_params
    params.require(:issue).permit(
      :number,
      :title,
      :body,
      :state,
      :url)
  end
end
