class IssueOpenedHandler
  def initialize(payload)
    @payload = payload
  end

  def call
    issue_body = payload['issue']['body']
    issue_number = payload['issue']['number']
    repo = payload['repository']['full_name']
    issue_creator = payload['issue']['user']['login']

    unless issue_body =~ /Estimate:\s*\d+\s*days/
      github_access_token = GithubAccessToken.new.call
      github_client = Octokit::Client.new(access_token: github_access_token)
      message = "Hi @#{issue_creator}! Please remember to include an estimate for this issue in the format ‘Estimate: X days’. This helps us scope and schedule the project effectively. Thank you!"
      github_client.add_comment(repo, issue_number, message)
    end
  end

  private
    attr_accessor :payload
end