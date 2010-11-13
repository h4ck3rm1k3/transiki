class GtfsStopTimesController < ApplicationController
  # GET /gtfs_stop_times
  # GET /gtfs_stop_times.xml
  def index
    @gtfs_stop_times = GtfsStopTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_stop_times }
    end
  end

  # GET /gtfs_stop_times/1
  # GET /gtfs_stop_times/1.xml
  def show
    @gtfs_stop_time = GtfsStopTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_stop_time }
    end
  end

  # GET /gtfs_stop_times/new
  # GET /gtfs_stop_times/new.xml
  def new
    @gtfs_stop_time = GtfsStopTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_stop_time }
    end
  end

  # GET /gtfs_stop_times/1/edit
  def edit
    @gtfs_stop_time = GtfsStopTime.find(params[:id])
  end

  # POST /gtfs_stop_times
  # POST /gtfs_stop_times.xml
  def create
    @gtfs_stop_time = GtfsStopTime.new(params[:gtfs_stop_time])

    respond_to do |format|
      if @gtfs_stop_time.save
        format.html { redirect_to(@gtfs_stop_time, :notice => 'Gtfs stop time was successfully created.') }
        format.xml  { render :xml => @gtfs_stop_time, :status => :created, :location => @gtfs_stop_time }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_stop_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_stop_times/1
  # PUT /gtfs_stop_times/1.xml
  def update
    @gtfs_stop_time = GtfsStopTime.find(params[:id])

    respond_to do |format|
      if @gtfs_stop_time.update_attributes(params[:gtfs_stop_time])
        format.html { redirect_to(@gtfs_stop_time, :notice => 'Gtfs stop time was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_stop_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_stop_times/1
  # DELETE /gtfs_stop_times/1.xml
  def destroy
    @gtfs_stop_time = GtfsStopTime.find(params[:id])
    @gtfs_stop_time.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_stop_times_url) }
      format.xml  { head :ok }
    end
  end
end
