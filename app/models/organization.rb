class Organization < ActiveRecord::Base
  has_many :locale_files
  mount_uploader :asset , AssetUploader
  
end
