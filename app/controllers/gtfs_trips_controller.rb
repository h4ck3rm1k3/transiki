class GtfsTripsController < ApplicationController
  # GET /gtfs_trips
  # GET /gtfs_trips.xml
  def index
    @gtfs_trips = GtfsTrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_trips }
    end
  end

  # GET /gtfs_trips/1
  # GET /gtfs_trips/1.xml
  def show
    @gtfs_trip = GtfsTrip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_trip }
    end
  end

  # GET /gtfs_trips/new
  # GET /gtfs_trips/new.xml
  def new
    @gtfs_trip = GtfsTrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_trip }
    end
  end

  # GET /gtfs_trips/1/edit
  def edit
    @gtfs_trip = GtfsTrip.find(params[:id])
  end

  # POST /gtfs_trips
  # POST /gtfs_trips.xml
  def create
    @gtfs_trip = GtfsTrip.new(params[:gtfs_trip])

    respond_to do |format|
      if @gtfs_trip.save
        format.html { redirect_to(@gtfs_trip, :notice => 'Gtfs trip was successfully created.') }
        format.xml  { render :xml => @gtfs_trip, :status => :created, :location => @gtfs_trip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_trips/1
  # PUT /gtfs_trips/1.xml
  def update
    @gtfs_trip = GtfsTrip.find(params[:id])

    respond_to do |format|
      if @gtfs_trip.update_attributes(params[:gtfs_trip])
        format.html { redirect_to(@gtfs_trip, :notice => 'Gtfs trip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_trips/1
  # DELETE /gtfs_trips/1.xml
  def destroy
    @gtfs_trip = GtfsTrip.find(params[:id])
    @gtfs_trip.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_trips_url) }
      format.xml  { head :ok }
    end
  end
end
