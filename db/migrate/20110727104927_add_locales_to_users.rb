# -*- encoding : utf-8 -*-
class AddLocalesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :locales, :string
  end

  def self.down
    remove_column :users, :locales
  end
end
