class LocaleFilesController < ApplicationController
  before_filter :authenticate_user!
  # GET /locale_files
  # GET /locale_files.xml
  def index
    @locale_files = LocaleFile.all if current_user.role=="admin"
    @locale_files = current_user.organization.locale_files unless  current_user.role=="admin"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locale_files }
    end
  end
  
  def translate_form
   @locale_file=LocaleFile.find params[:id]
   @locale_from=LocaleFile.where(:name=>@locale_file.name,:locale=>"it",:organization_id=>@locale_file.organization_id).first
   @yaml_from= @locale_from.get_shallow_hash
   @yaml_to=  @locale_file.get_shallow_hash
  end
  
  def translate
    @yaml=LocaleFile.to_deep_hash(params[:translate_file])
    @locale_file=LocaleFile.find params[:id]
    @locale_file.save_shallow_hash_with_locale(params[:translate_file])
    # @locale_from=LocaleFile.where(:name=>@locale_file.name,:locale=>"it",:organization_id=>@locale_file.organization_id).first
    #    @yaml_from= @locale_from.get_shallow_hash
    #    @yaml_to=  @locale_file.get_shallow_hash
    @locale_files = LocaleFile.all if current_user.role=="admin"
    @locale_files = current_user.organization.locale_files unless  current_user.role=="admin"
    flash[:notice]="File #{@locale_file.name} salvato con successo"
    render :action=>:index
  end

  # GET /locale_files/1
  # GET /locale_files/1.xml
  def show
    @locale_file = LocaleFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locale_file }
    end
  end

  # GET /locale_files/new
  # GET /locale_files/new.xml
  def new
    @locale_file = LocaleFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locale_file }
    end
  end

  # GET /locale_files/1/edit
  def edit
    @locale_file = LocaleFile.find(params[:id])
  end

  # POST /locale_files
  # POST /locale_files.xml
  def create
    @locale_file = LocaleFile.new(params[:locale_file])

    respond_to do |format|
      if @locale_file.save
        format.html { redirect_to(@locale_file, :notice => 'Locale file was successfully created.') }
        format.xml  { render :xml => @locale_file, :status => :created, :location => @locale_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locale_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locale_files/1
  # PUT /locale_files/1.xml
  def update
    @locale_file = LocaleFile.find(params[:id])

    respond_to do |format|
      if @locale_file.update_attributes(params[:locale_file])
        format.html { redirect_to(@locale_file, :notice => 'Locale file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locale_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locale_files/1
  # DELETE /locale_files/1.xml
  def destroy
    @locale_file = LocaleFile.find(params[:id])
    @locale_file.destroy

    respond_to do |format|
      format.html { redirect_to(locale_files_url) }
      format.xml  { head :ok }
    end
  end
end
