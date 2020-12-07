AssetSync.configure do |config|
  config.enabled = false if Rails.env.development? # ここを追記
  config.fog_provider = 'AWS'
  config.fog_directory = 'cataly-backet'
  config.aws_access_key_id = 'AKIAUSMSHC3D57R5AU3Q'
  config.aws_secret_access_key = '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'
  config.manifest = true
  config.fog_region = `ap-northeast-1`
  config.fog_path_style = true
end
