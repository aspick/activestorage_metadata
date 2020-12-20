class ActiveStorage::Blob

  private

    alias original_service_metadata service_metadata
    def service_metadata
      original_service_metadata.tap do |m|
        m[:metadata] = metadata[:custom_metadata] if metadata[:custom_metadata]
      end
    end
end
