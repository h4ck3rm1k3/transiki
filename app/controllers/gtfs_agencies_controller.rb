class GtfsAgenciesController < ApplicationController
  # GET /gtfs_agencies
  # GET /gtfs_agencies.xml
  def index
    @gtfs_agencies = GtfsAgency.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_agencies }
    end
  end

  # GET /gtfs_agencies/1
  # GET /gtfs_agencies/1.xml
  def show
    @gtfs_agency = GtfsAgency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_agency }
    end
  end

  # GET /gtfs_agencies/new
  # GET /gtfs_agencies/new.xml
  def new
    @gtfs_agency = GtfsAgency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_agency }
    end
  end

  # GET /gtfs_agencies/1/edit
  def edit
    @gtfs_agency = GtfsAgency.find(params[:id])
  end

  # POST /gtfs_agencies
  # POST /gtfs_agencies.xml
  def create
    @gtfs_agency = GtfsAgency.new(params[:gtfs_agency])

    respond_to do |format|
      if @gtfs_agency.save
        format.html { redirect_to(@gtfs_agency, :notice => 'Gtfs agency was successfully created.') }
        format.xml  { render :xml => @gtfs_agency, :status => :created, :location => @gtfs_agency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_agencies/1
  # PUT /gtfs_agencies/1.xml
  def update
    @gtfs_agency = GtfsAgency.find(params[:id])

    respond_to do |format|
      if @gtfs_agency.update_attributes(params[:gtfs_agency])
        format.html { redirect_to(@gtfs_agency, :notice => 'Gtfs agency was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_agencies/1
  # DELETE /gtfs_agencies/1.xml
  def destroy
    @gtfs_agency = GtfsAgency.find(params[:id])
    @gtfs_agency.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_agencies_url) }
      format.xml  { head :ok }
    end
  end
end
