Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'seed.koagenblog.com' }
  config.consider_all_requests_local = true
end
