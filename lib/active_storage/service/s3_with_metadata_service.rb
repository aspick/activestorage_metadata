require 'active_storage/service/s3_service'

module ActiveStorage
  class Service::S3WithMetadataService < Service::S3Service
    def upload(key, io, checksum: nil, filename: nil, content_type: nil, disposition: nil, **rest)
      @upload_options[:metadata] = rest[:metadata] if rest[:metadata]

      super(key, io, checksum: checksum, filename: filename, content_type: content_type, disposition: disposition)
    end
  end
end
