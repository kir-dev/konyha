Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :oauth, ENV.fetch('CLIENT_ID'), ENV.fetch('CLIENT_SECRET')
end