class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token  # Skip CSRF check for webhooks

  def receive
    payload = JSON.parse(request.body.read)

    # Handle the issue creation event
    IssueOpenedHandler.new(payload).call if payload['action'] == 'opened' && payload['issue']

    # Return a 200 status to acknowledge receipt
    head :ok
  end
end
