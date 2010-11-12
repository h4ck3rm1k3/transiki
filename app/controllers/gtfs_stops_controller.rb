class GtfsStopsController < ApplicationController
  # GET /gtfs_stops
  # GET /gtfs_stops.xml
  def index
    @gtfs_stops = GtfsStop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_stops }
    end
  end

  # GET /gtfs_stops/1
  # GET /gtfs_stops/1.xml
  def show
    @gtfs_stop = GtfsStop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_stop }
    end
  end

  # GET /gtfs_stops/new
  # GET /gtfs_stops/new.xml
  def new
    @gtfs_stop = GtfsStop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_stop }
    end
  end

  # GET /gtfs_stops/1/edit
  def edit
    @gtfs_stop = GtfsStop.find(params[:id])
  end

  # POST /gtfs_stops
  # POST /gtfs_stops.xml
  def create
    @gtfs_stop = GtfsStop.new(params[:gtfs_stop])

    respond_to do |format|
      if @gtfs_stop.save
        format.html { redirect_to(@gtfs_stop, :notice => 'Gtfs stop was successfully created.') }
        format.xml  { render :xml => @gtfs_stop, :status => :created, :location => @gtfs_stop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_stops/1
  # PUT /gtfs_stops/1.xml
  def update
    @gtfs_stop = GtfsStop.find(params[:id])

    respond_to do |format|
      if @gtfs_stop.update_attributes(params[:gtfs_stop])
        format.html { redirect_to(@gtfs_stop, :notice => 'Gtfs stop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_stops/1
  # DELETE /gtfs_stops/1.xml
  def destroy
    @gtfs_stop = GtfsStop.find(params[:id])
    @gtfs_stop.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_stops_url) }
      format.xml  { head :ok }
    end
  end
end
