class FuploadRails::Asset < ActiveRecord::Base
  self.table_name = :fupload_rails_assets

  mount_uploader :data, FuploadRailsAssetUploader, :mount_on => :data_file_name

  belongs_to :assetable, :polymorphic => true

  attr_accessible :data, :assetable_type, :assetable_id, :assetable

end
