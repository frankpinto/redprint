CarrierWave.configure do |config|
  config.cache_dir = 'tmp/'
  config.storage = :fog
  config.permissions = 0644
  config.fog_credentials = { # required
    :provider               => '',
    :aws_access_key_id      => '',
    :aws_secret_access_key  => '',
    :path_style             => true,
    :persistent             => false
  }
  config.fog_public = true

  # config.fog_directory = 'toolstest.ayalo.co' if ENV["RAILS_ENV"] == "test" || ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "beta"
  config.fog_directory = 'tools.ayalo.co'
end
