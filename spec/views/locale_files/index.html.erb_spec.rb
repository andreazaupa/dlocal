# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "locale_files/index.html.erb" do
  before(:each) do
    assign(:locale_files, [
      stub_model(LocaleFile,
        :original_file => "Original File",
        :file => "File",
        :name => "Name",
        :locale => "Locale",
        :original => false,
        :organization_id => 1
      ),
      stub_model(LocaleFile,
        :original_file => "Original File",
        :file => "File",
        :name => "Name",
        :locale => "Locale",
        :original => false,
        :organization_id => 1
      )
    ])
  end

  it "renders a list of locale_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Original File".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
