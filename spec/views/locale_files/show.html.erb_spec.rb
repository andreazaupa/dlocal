require 'spec_helper'

describe "locale_files/show.html.erb" do
  before(:each) do
    @locale_file = assign(:locale_file, stub_model(LocaleFile,
      :original_file => "Original File",
      :file => "File",
      :name => "Name",
      :locale => "Locale",
      :original => false,
      :organization_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Original File/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Locale/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
