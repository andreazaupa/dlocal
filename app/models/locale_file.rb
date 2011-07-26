require 'carrierwave/orm/activerecord'
class LocaleFile < ActiveRecord::Base
  mount_uploader :asset , AssetUploader
  belongs_to :organization

  validates_presence_of :asset

  before_validation :update_asset_attributes
  
  
  def get_hash
   self.asset ? YAML.load_file(self.asset.path) : {}
  end
  
  def save_shallow_hash_with_locale(shallow_hash)
    loc_hash={}
    shallow_hash.each do |k,v|
      loc_hash["#{self.locale}.#{k}"]=v
    end
    self.save_shallow_hash loc_hash
  end
  
  def save_shallow_hash(shallow_hash)
    hash=self.class.to_deep_hash(shallow_hash)    
    temp_file_name=File.join(Rails.root,"tmp","temp#{Time.now.to_s}#{rand}")
    f=File.new(self.asset.path,"w")
    f.write(hash.to_yaml)
    f.close
  end
  
  def save_hash(hash)
  
  end
  
  def get_shallow_hash
   h=self.get_hash
   LocaleFile::to_shallow_hash(h[h.keys.first])
  end
  
  def self.to_shallow_hash(hash)
     hash.inject({}) do |shallow_hash, (key, value)|
       if value.is_a?(Hash)
         to_shallow_hash(value).each do |sub_key, sub_value|
           shallow_hash[[key, sub_key].join(".")] = sub_value
         end
       else
         shallow_hash[key.to_s] = value
       end
       shallow_hash
     end
   end
   # deep_merge by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
   def self.deep_merge!(hash1, hash2)
     merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
     hash1.merge!(hash2, &merger)
   end
   
   
   def self.to_deep_hash(hash)    
     hash.inject({}) do |deep_hash, (key, value)|
       keys = key.to_s.split('.').reverse
       leaf_key = keys.shift
       key_hash = keys.inject({leaf_key.to_sym => value}) { |hash, key| {key.to_sym => hash} }
       deep_merge!(deep_hash, key_hash)
       deep_hash
     end
   end
   

  
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
