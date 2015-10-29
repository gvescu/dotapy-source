OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, '2EE9DA4A92C310F75CE48222C064D9E9'
end
