class FuploadRails::Asset < ActiveRecord::Base
  self.table_name = :fupload_rails_assets

  belongs_to :assetable, :polymorphic => true

  mount_uploader :data, FuploadRailsAssetUploader, :mount_on => :data_file_name

  delegate :url, :current_path, :size, :content_type, :filename, :to => :data

  validates_presence_of :data

  attr_accessible :data, :assetable_type, :assetable_id, :assetable

  scope :by_assetable, ->(objs) {
    arel = nil
    objs.each do |obj|
      one_arel = arel_table[:assetable_id].eq(obj.id).and(arel_table[:assetable_type].eq(obj.class.to_s))
      if arel.nil?
        arel = one_arel
      else
        arel = arel.or(one_arel)
      end
    end
    where(arel)
  }
end
