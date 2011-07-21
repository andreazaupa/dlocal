require 'carrierwave/orm/activerecord'
class LocaleFile < ActiveRecord::Base
  mount_uploader :asset , AssetUploader
  belongs_to :organization

  validates_presence_of :asset

  before_validation :update_asset_attributes

  private

  def update_asset_attributes
    if asset.present? && asset_changed?
      self.asset_file_name = asset.file.filename
    end
    errors.add :base , "il file non sembra un file di traduzione" if !(self.asset_file_name.match /^.*\...\.yml$/)
    if (self.asset_file_name.match /^.*\...\.yml$/)
      self.name=self.asset_file_name.split(".").first
      self.locale=self.asset_file_name.split(".")[1]
    end
  end


end
