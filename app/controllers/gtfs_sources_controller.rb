class GtfsSourcesController < ApplicationController
  # GET /gtfs_sources
  # GET /gtfs_sources.xml

  require 'uri'
  require 'net/http'
  require 'archive/zip'



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

  def import_generic (path,dest)
    
# simple delete 
    dest.delete_all if dest.all.any?
    print "Importing records..."
  #  p dest
#	count =0

    file =path;
    p "going to parse" + file
	FasterCSV.foreach( file, { :headers        => true, :converters        => :numeric,    :header_converters => :symbol } ) do |row|
#	count++	

#	if ((count % 1000) ==0) do	p count end
#	p row

	obj = dest.create!(row.to_hash)
      	obj.gtfs_source_id= @gtfs_source.id
      	obj.save
    end
    puts "#{dest.count} imported."
  end


  def import_trips(base)
    import_generic(base  + "trips.txt",GtfsTrip)
    #block_id,route_id,direction_id,trip_headsign,shape_id,service_id,trip_id
    end
  
  def import_routes(base)
    import_generic(base  + "routes.txt",GtfsRoute)
  end

  def import_stoptimes(base)
    import_generic(base  + "stop_times.txt",GtfsStopTime)    
  end
    
  def import_stops(base)
    import_generic(base  + "stops.txt",GtfsStop)    
  end
    
  def import_calendars(base)
    import_generic(base  + "calendar.txt",GtfsCalendar)    
  end

  def  import_fare_attributes(base) 
    import_generic(base  + "fare_attributes.txt",GtfsFareAttribute)    
  end

  def  import_agency(base) 
    import_generic(base  + "agency.txt",GtfsAgency)    
  end

  def  import_calendar_dates(base) 
    import_generic(base  + "calendar_dates.txt",GtfsCalendarDate)    
  end


  def import
    @gtfs_source = GtfsSource.find(params[:gtfs_source_id])
    p @gtfs_source.url

    target = File.dirname(__FILE__) + '/../../test/fixtures/gtfs/';
    target_out = target + "/" + @gtfs_source.id.to_s + "/"
    local_filename=  target + @gtfs_source.id.to_s + "download.zip"
    Dir.mkdir(target) unless File.exists? target
    Dir.mkdir(target_out) unless File.exists? target_out

    if(!File.exists? local_filename)
      url = @gtfs_source.url
      r = Net::HTTP.get_response(URI.parse(url).host, URI.parse(url).path)
      File.open(local_filename,'w') {|f|
        f.write(r.body)
      }            
      Archive::Zip.extract(local_filename, target_out)
    end

    # now we can be sure the file is there and unpacked.
    # now to import the fields
    import_fare_attributes(target_out) 
    import_agency(target_out) 
    import_calendar_dates(target_out) 
    import_stoptimes(target_out) # the big one 
    import_calendars(target_out)
    import_stops(target_out)
    import_trips(target_out)
    import_routes(target_out)


    
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
