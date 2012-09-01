require "fupload-rails/version"

module FuploadRails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  mattr_accessor :image_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]


  require 'fupload-rails/engine'
  require 'fupload-rails/helpers'

  autoload :Http, 'fupload-rails/http'
end
