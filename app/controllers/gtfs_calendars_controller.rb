class GtfsCalendarsController < ApplicationController
  # GET /gtfs_calendars
  # GET /gtfs_calendars.xml
  def index
    @gtfs_calendars = GtfsCalendar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_calendars }
    end
  end

  # GET /gtfs_calendars/1
  # GET /gtfs_calendars/1.xml
  def show
    @gtfs_calendar = GtfsCalendar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_calendar }
    end
  end

  # GET /gtfs_calendars/new
  # GET /gtfs_calendars/new.xml
  def new
    @gtfs_calendar = GtfsCalendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_calendar }
    end
  end

  # GET /gtfs_calendars/1/edit
  def edit
    @gtfs_calendar = GtfsCalendar.find(params[:id])
  end

  # POST /gtfs_calendars
  # POST /gtfs_calendars.xml
  def create
    @gtfs_calendar = GtfsCalendar.new(params[:gtfs_calendar])

    respond_to do |format|
      if @gtfs_calendar.save
        format.html { redirect_to(@gtfs_calendar, :notice => 'Gtfs calendar was successfully created.') }
        format.xml  { render :xml => @gtfs_calendar, :status => :created, :location => @gtfs_calendar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_calendars/1
  # PUT /gtfs_calendars/1.xml
  def update
    @gtfs_calendar = GtfsCalendar.find(params[:id])

    respond_to do |format|
      if @gtfs_calendar.update_attributes(params[:gtfs_calendar])
        format.html { redirect_to(@gtfs_calendar, :notice => 'Gtfs calendar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_calendars/1
  # DELETE /gtfs_calendars/1.xml
  def destroy
    @gtfs_calendar = GtfsCalendar.find(params[:id])
    @gtfs_calendar.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_calendars_url) }
      format.xml  { head :ok }
    end
  end
end
