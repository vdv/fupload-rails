module FuploadRails
  module ControllerHelpers
    def normalize_upload_file(file)
      Http.normalize_param(file, request)
    end
  end
end
