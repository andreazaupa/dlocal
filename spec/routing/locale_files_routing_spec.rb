# -*- encoding : utf-8 -*-
require "spec_helper"

describe LocaleFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/locale_files").should route_to("locale_files#index")
    end

    it "routes to #new" do
      get("/locale_files/new").should route_to("locale_files#new")
    end

    it "routes to #show" do
      get("/locale_files/1").should route_to("locale_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/locale_files/1/edit").should route_to("locale_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/locale_files").should route_to("locale_files#create")
    end

    it "routes to #update" do
      put("/locale_files/1").should route_to("locale_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/locale_files/1").should route_to("locale_files#destroy", :id => "1")
    end

  end
end
