CarrierWave.configure do |config|

  if Rails.env.production?
    ENV = YAML::load_file('config/application.yml')
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'us-east-2'
    }
    config.storage = :fog
    config.permissions = 0666
    config.cache_dir = "#{Rails.root}/tmp/"
    config.fog_directory = ENV['FOG_DIRECTORY']
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  else
    config.storage = :file
    config.enable_processing = false
  end
end
