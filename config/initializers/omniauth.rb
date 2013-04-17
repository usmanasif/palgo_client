require File.expand_path('lib/omniauth/strategies/palgo', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :palgo, OAUTH_ID, OAUTH_SECRET
end