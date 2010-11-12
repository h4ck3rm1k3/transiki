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



  def import_trips
      Trip.delete_all if Trip.all.any?
      print "Importing Trip records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/trips.txt")
      rows[1..rows.length].each do |column|
        trip = Trip.new
        trip.route_id = column[0]
        trip.service_id = column[1]
        trip.trip_id = column[2]
        trip.trip_headsign = column[3]
        trip.block_id = column[4]
        trip.shape_id = column[5]
        trip.save!
      end
      puts "#{Trip.count} imported."
    end
  
  def import_routes
      Route.delete_all if Route.all.any?
      print "Importing Route records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/routes.txt")
      rows[1..rows.length].each do |column|
        route = Route.new
        route.route_id = column[0]
        route.agency_id = column[1]
        route.route_short_name = column[2]
        route.route_long_name = column[3]
        route.route_desc = column[4]
        route.route_type = column[5]
        route.route_url = column[6]
        route.save!
      end
      puts "#{Route.count} imported."
    end

  def import_stoptimes    
      StopTime.delete_all if StopTime.all.any?
      print "Importing StopTime records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/stop_times.txt")
      rows[1..rows.length].each do |column|
        stop_time = StopTime.new
        stop_time.trip_id = column[0]
        stop_time.arrival_time = column[1]
        stop_time.departure_time = column[2]
        stop_time.stop_id = column[3]
        stop_time.stop_sequence = column[4]
        stop_time.pickup_type = column[5]
        stop_time.save!
      end
      puts "#{StopTime.count} imported."
    end
    
  def import_stops
      Stop.delete_all if Stop.all.any?
      print "Importing Stop records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/stops.txt")
      rows[1..rows.length].each do |column|
        stop = Stop.new
        stop.stop_id = column[0]
        stop.stop_name = column[1]
        stop.stop_description = column[2]
        stop.stop_lat = column[3]
        stop.stop_lon = column[4]
        stop.stop_street = column[5]
        stop.stop_city = column[6]
        stop.stop_region = column[7]
        stop.stop_postcode = column[8]
        stop.stop_country = column[9]
        stop.save!
      end
      puts "#{Stop.count} imported."
    end
    

  def import_calendars (path)
    
# simple delete 
    GtfsCalendar.delete_all if GtfsCalendar.all.any?
    print "Importing Calendar records..."

    file =path + "calendar.txt"
    p "going to parse" + file
    rows = FasterCSV.table(file)
    rows.each do |row|
      obj = GtfsCalendar.create!(row.to_hash)
      obj.gtfs_source_id= @gtfs_source.id
      p obj
      obj.save
    end

    puts "#{GtfsCalendar.count} imported."
  end

  def test12
      calendar = GtfsCalendar.new
      calendar.gtfs_source_id = @gtfs_source.id
      calendar.service_id = column["service_id"]
      calendar.start_date = column["start_date"]
      calendar.end_date = column["end_date"]
      calendar.monday = column["monday"]
      calendar.tuesday = column["tuesday"]
      calendar.wednesday = column["wednesday"]
      calendar.thursday = column["thursday"]
      calendar.friday = column["friday"]
      calendar.saturday = column["saturday"]
      calendar.sunday = column["sunday"]
      calendar.save!

end 
  def import
    @gtfs_source = GtfsSource.find(params[:gtfs_source_id])
    p @gtfs_source.url

    target = File.dirname(__FILE__) + '/../../test/fixtures/gtfs/';
    target_out = target + "/" + @gtfs_source.id.to_s + "/"
    local_filename=  target + @gtfs_source.id.to_s + "download.zip"
    Dir.mkdir(target) unless File.exists? target
    Dir.mkdir(target_out) unless File.exists? target_out

    if (!File.exists? local_filename)
      url = @gtfs_source.url
      r = Net::HTTP.get_response(URI.parse(url).host, URI.parse(url).path)
      File.open(local_filename,'w') {|f|
        f.write(r.body)
      }            
      Archive::Zip.extract(local_filename, target_out)
    end

    # now we can be sure the file is there and unpacked.
    # now to import the fields
    import_calendars(target_out)
    
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
