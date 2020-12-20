require "activestorage_metadata/version"

require 'active_storage'
require 'active_storage/service/s3_with_metadata_service'

require 'active_support/lazy_load_hooks'

ActiveSupport.on_load(:active_storage_blob) do
  require_relative './active_storage/blob'
end

