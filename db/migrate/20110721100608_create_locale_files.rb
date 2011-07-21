class CreateLocaleFiles < ActiveRecord::Migration
  def self.up
    create_table :locale_files do |t|
      t.string :original_file
      t.string :asset
      t.string :name
      t.string :locale
      t.boolean :original
      t.integer :organization_id
      t.string :asset_file_name
      t.timestamps
    end
  end

  def self.down
    drop_table :locale_files
  end
end
