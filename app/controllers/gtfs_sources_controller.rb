class GtfsSourcesController < ApplicationController
  # GET /gtfs_sources
  # GET /gtfs_sources.xml
  def index
    @gtfs_sources = GtfsSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_sources }
    end
  end

  # GET /gtfs_sources/1
  # GET /gtfs_sources/1.xml
  def show
    @gtfs_source = GtfsSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_source }
    end
  end

  # GET /gtfs_sources/new
  # GET /gtfs_sources/new.xml
  def new
    @gtfs_source = GtfsSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_source }
    end
  end

  # GET /gtfs_sources/1/edit
  def edit
    @gtfs_source = GtfsSource.find(params[:id])
  end

  # POST /gtfs_sources
  # POST /gtfs_sources.xml
  def create
    @gtfs_source = GtfsSource.new(params[:gtfs_source])

    respond_to do |format|
      if @gtfs_source.save
        format.html { redirect_to(@gtfs_source, :notice => 'Gtfs source was successfully created.') }
        format.xml  { render :xml => @gtfs_source, :status => :created, :location => @gtfs_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_sources/1
  # PUT /gtfs_sources/1.xml
  def update
    @gtfs_source = GtfsSource.find(params[:id])

    respond_to do |format|
      if @gtfs_source.update_attributes(params[:gtfs_source])
        format.html { redirect_to(@gtfs_source, :notice => 'Gtfs source was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_sources/1
  # DELETE /gtfs_sources/1.xml
  def destroy
    @gtfs_source = GtfsSource.find(params[:id])
    @gtfs_source.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_sources_url) }
      format.xml  { head :ok }
    end
  end
end
