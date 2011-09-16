# -*- encoding : utf-8 -*-
class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :locales
      t.boolean :active
      t.string :asset
      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
