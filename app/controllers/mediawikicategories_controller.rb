class MediawikicategoriesController < ApplicationController
  # GET /mediawikicategories
  # GET /mediawikicategories.xml
  def index
    @mediawikicategories = Mediawikicategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediawikicategories }
    end
  end

  # GET /mediawikicategories/1
  # GET /mediawikicategories/1.xml
  def show
    @mediawikicategory = Mediawikicategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikicategory }
    end
  end

  # GET /mediawikicategories/new
  # GET /mediawikicategories/new.xml
  def new
    @mediawikicategory = Mediawikicategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mediawikicategory }
    end
  end

  # GET /mediawikicategories/1/edit
  def edit
    @mediawikicategory = Mediawikicategory.find(params[:id])
  end

  # POST /mediawikicategories
  # POST /mediawikicategories.xml
  def create
    @mediawikicategory = Mediawikicategory.new(params[:mediawikicategory])

    respond_to do |format|
      if @mediawikicategory.save
        format.html { redirect_to(@mediawikicategory, :notice => 'Mediawikicategory was successfully created.') }
        format.xml  { render :xml => @mediawikicategory, :status => :created, :location => @mediawikicategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediawikicategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mediawikicategories/1
  # PUT /mediawikicategories/1.xml
  def update
    @mediawikicategory = Mediawikicategory.find(params[:id])

    respond_to do |format|
      if @mediawikicategory.update_attributes(params[:mediawikicategory])
        format.html { redirect_to(@mediawikicategory, :notice => 'Mediawikicategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mediawikicategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mediawikicategories/1
  # DELETE /mediawikicategories/1.xml
  def destroy
    @mediawikicategory = Mediawikicategory.find(params[:id])
    @mediawikicategory.destroy

    respond_to do |format|
      format.html { redirect_to(mediawikicategories_url) }
      format.xml  { head :ok }
    end
  end
end
