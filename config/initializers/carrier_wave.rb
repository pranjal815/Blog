require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
  # This is the new way!
  config.fog_provider = 'fog/aws'
end
