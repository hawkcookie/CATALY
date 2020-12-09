require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'cataly-backet'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_DEFAULT_REGION'],
    path_style: true
  }
  config.fog_directory  = ENV['S3_BUCKET']


end




    # aws_access_key_id: ENV['AKIAUSMSHC3D57R5AU3Q'],
    # aws_secret_access_key: ENV['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'],
    # region: ENV['ap-northeast-1'],


    # aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    # aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    # region: 'ap-northeast-1'
    #
    # config.fog_directory  = 'cataly-backet'
    # config.asset_host = 'https://s3-ap-northeast1.amazonaws.com/cataly-backet' #url間違い
    # config.asset_host = 'https://cataly-backet.s3.amazonaws.com' #このように修正
