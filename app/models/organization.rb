# -*- encoding : utf-8 -*-
class Organization < ActiveRecord::Base
  has_many :locale_files
  has_many :users
  mount_uploader :asset , AssetUploader

  after_save :create_files ,:on=>:create

  def create_files
    if git_uri
      self.checkout_and_associate
    elsif asset && asset.file  
      self.unzip_and_associate
    end
  end
  
  def checkout_and_associate
    if git_uri.present?
      reponame=Time.now.strftime("%d%m%Y%H%M%S")
      repopath=File.join(Rails.root,"tmp",reponame)
      `git clone #{git_uri} #{repopath}`
      Find.find(repopath+"/config/locales").each do |p|
        if File.basename(p).match /^.*\...\.yml$/
          LocaleFile.create :organization_id=>self.id ,:asset=>File.new(p,"r")   
        elsif File.basename(p).match /^..\.yml$/
          FileUtils.cp(p,p.gsub("#{p.split("/").last}","base.#{p.split("/").last}"))
          np=p.gsub("#{p.split("/").last}","base.#{p.split('/').last}")
          LocaleFile.create :organization_id=>self.id ,:asset=>File.new(np,"r")  
        end
      end
      `rm -fr #{repopath}`
     #checkout only locales and associate files using grit
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
