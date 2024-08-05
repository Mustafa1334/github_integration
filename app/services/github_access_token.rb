class GithubAccessToken
  def call
    generate
  end

  private
    def generate
      # Generate a JWT token using your GITHUB_PRIVATE_KEY and GITHUB_APP_IDENTIFIER
      private_key = OpenSSL::PKey::RSA.new(Base64.decode64(ENV["GITHUB_PRIVATE_KEY"]))
      payload = {
        iat: Time.now.to_i,
        exp: Time.now.to_i + (10 * 60),
        iss: ENV['GITHUB_APP_ID']
      }

      jwt = JWT.encode(payload, private_key, 'RS256')

      # Exchange the JWT for an installation access token
      installation_id = ENV['GITHUB_INSTALLATION_ID']
      client = Octokit::Client.new(bearer_token: jwt)
      response = client.create_app_installation_access_token(installation_id)
      response.token
    end
end
