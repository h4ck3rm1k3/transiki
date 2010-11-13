class GtfsCalendarDatesController < ApplicationController
  # GET /gtfs_calendar_dates
  # GET /gtfs_calendar_dates.xml
  def index
    @gtfs_calendar_dates = GtfsCalendarDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_calendar_dates }
    end
  end

  # GET /gtfs_calendar_dates/1
  # GET /gtfs_calendar_dates/1.xml
  def show
    @gtfs_calendar_date = GtfsCalendarDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_calendar_date }
    end
  end

  # GET /gtfs_calendar_dates/new
  # GET /gtfs_calendar_dates/new.xml
  def new
    @gtfs_calendar_date = GtfsCalendarDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_calendar_date }
    end
  end

  # GET /gtfs_calendar_dates/1/edit
  def edit
    @gtfs_calendar_date = GtfsCalendarDate.find(params[:id])
  end

  # POST /gtfs_calendar_dates
  # POST /gtfs_calendar_dates.xml
  def create
    @gtfs_calendar_date = GtfsCalendarDate.new(params[:gtfs_calendar_date])

    respond_to do |format|
      if @gtfs_calendar_date.save
        format.html { redirect_to(@gtfs_calendar_date, :notice => 'Gtfs calendar date was successfully created.') }
        format.xml  { render :xml => @gtfs_calendar_date, :status => :created, :location => @gtfs_calendar_date }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_calendar_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_calendar_dates/1
  # PUT /gtfs_calendar_dates/1.xml
  def update
    @gtfs_calendar_date = GtfsCalendarDate.find(params[:id])

    respond_to do |format|
      if @gtfs_calendar_date.update_attributes(params[:gtfs_calendar_date])
        format.html { redirect_to(@gtfs_calendar_date, :notice => 'Gtfs calendar date was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_calendar_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_calendar_dates/1
  # DELETE /gtfs_calendar_dates/1.xml
  def destroy
    @gtfs_calendar_date = GtfsCalendarDate.find(params[:id])
    @gtfs_calendar_date.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_calendar_dates_url) }
      format.xml  { head :ok }
    end
  end
end
