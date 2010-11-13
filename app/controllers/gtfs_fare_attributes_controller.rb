class GtfsFareAttributesController < ApplicationController
  # GET /gtfs_fare_attributes
  # GET /gtfs_fare_attributes.xml
  def index
    @gtfs_fare_attributes = GtfsFareAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_fare_attributes }
    end
  end

  # GET /gtfs_fare_attributes/1
  # GET /gtfs_fare_attributes/1.xml
  def show
    @gtfs_fare_attribute = GtfsFareAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_fare_attribute }
    end
  end

  # GET /gtfs_fare_attributes/new
  # GET /gtfs_fare_attributes/new.xml
  def new
    @gtfs_fare_attribute = GtfsFareAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_fare_attribute }
    end
  end

  # GET /gtfs_fare_attributes/1/edit
  def edit
    @gtfs_fare_attribute = GtfsFareAttribute.find(params[:id])
  end

  # POST /gtfs_fare_attributes
  # POST /gtfs_fare_attributes.xml
  def create
    @gtfs_fare_attribute = GtfsFareAttribute.new(params[:gtfs_fare_attribute])

    respond_to do |format|
      if @gtfs_fare_attribute.save
        format.html { redirect_to(@gtfs_fare_attribute, :notice => 'Gtfs fare attribute was successfully created.') }
        format.xml  { render :xml => @gtfs_fare_attribute, :status => :created, :location => @gtfs_fare_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_fare_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_fare_attributes/1
  # PUT /gtfs_fare_attributes/1.xml
  def update
    @gtfs_fare_attribute = GtfsFareAttribute.find(params[:id])

    respond_to do |format|
      if @gtfs_fare_attribute.update_attributes(params[:gtfs_fare_attribute])
        format.html { redirect_to(@gtfs_fare_attribute, :notice => 'Gtfs fare attribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_fare_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_fare_attributes/1
  # DELETE /gtfs_fare_attributes/1.xml
  def destroy
    @gtfs_fare_attribute = GtfsFareAttribute.find(params[:id])
    @gtfs_fare_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_fare_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
