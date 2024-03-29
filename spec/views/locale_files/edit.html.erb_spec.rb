# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "locale_files/edit.html.erb" do
  before(:each) do
    @locale_file = assign(:locale_file, stub_model(LocaleFile,
      :original_file => "MyString",
      :file => "MyString",
      :name => "MyString",
      :locale => "MyString",
      :original => false,
      :organization_id => 1
    ))
  end

  it "renders the edit locale_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locale_files_path(@locale_file), :method => "post" do
      assert_select "input#locale_file_original_file", :name => "locale_file[original_file]"
      assert_select "input#locale_file_file", :name => "locale_file[file]"
      assert_select "input#locale_file_name", :name => "locale_file[name]"
      assert_select "input#locale_file_locale", :name => "locale_file[locale]"
      assert_select "input#locale_file_original", :name => "locale_file[original]"
      assert_select "input#locale_file_organization_id", :name => "locale_file[organization_id]"
    end
  end
end
