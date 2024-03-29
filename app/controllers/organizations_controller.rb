# -*- encoding : utf-8 -*-
class OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin!

  
  # GET /organizationsa
  # GET /organizations.xml
  def index
    @organizations = Organization.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end
  
  def new_from_git
     @organization = Organization.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @organization }
      end
  end
  
  
  def get_zip
    @organization = Organization.find(params[:id])
    t = Tempfile.new("some-weird-temp-file-basename-#{request.remote_ip}-#{rand}")
    Zip::ZipOutputStream.open(t.path) do |zos|
      @organization.locale_files.collect(&:asset).each do |asset|
        name=File.basename(asset.path)
        if name.include? "base."
          name=name.gsub("base.","")
        end
        zos.put_next_entry(name)
        zos.write File.new(asset.path,"r").read
      end
    end
    send_data t.read, :type => 'application/zip',  :filename => "locales_#{@organization.name}_#{Time.now.strftime("%Y%m%d")}.zip"
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to(@organization, :notice => 'Organization was successfully created.') }
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to(@organization, :notice => 'Organization was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.xml
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to(organizations_url) }
      format.xml  { head :ok }
    end
  end
end
