class Organization < ActiveRecord::Base
  has_many :locale_files
  has_many :users
  mount_uploader :asset , AssetUploader

  after_save :create_files ,:on=>:create

  def create_files
    if asset && asset.file  
      self.unzip_and_associate
    end
  end

  def unzip_and_associate
    if asset.present?
      folder=Time.now.strftime"%Y%m%d%H%M%S"
      folder=File.join(Rails.root,"tmp","zip",folder)
      `mkdir -p #{folder}`
      `unzip #{asset.path} -d #{folder}`
      Find.find(folder).each do |p|
        LocaleFile.create :organization_id=>self.id ,:asset=>File.new(p,"r")   if p.match /^.*\...\.yml$/
      end
    end
  end

end
