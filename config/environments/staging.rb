require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"), subject_prefix: '[STAGING]')
)

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'staging.test_app.com' }

  config.action_controller.asset_host = "d2wn8dbvd7ovdn.cloudfront.net"
end
