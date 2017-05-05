OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'], {
    scope: ['https://mail.google.com/','contacts','plus.login','plus.me','userinfo.email','userinfo.profile']
  }
end

# export GOOGLE_CLIENT_ID="614630957953-nb4hbgit2qs7g68kuoil6hmp3vs31jcc.apps.googleusercontent.com"
# export GOOGLE_SECRET="bZXsIb5jbe9ONsYvgczj3px7"