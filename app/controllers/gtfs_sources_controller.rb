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



 # source should be a zip file.
 # target should be a directory to output the contents to.
  def unzip_file(source, target)
    # Create the target directory.
    # We'll ignore the error scenario where
    begin
      Dir.mkdir(target) unless File.exists? target
    end



    Zip::ZipFile.open(source) do |zipfile|
      dir = zipfile.dir
      
      dir.entries('.').each do |entry|
        zipfile.extract(entry, "#{target}/#{entry}")
      end
  end    
    
  rescue Zip::ZipDestinationFileExistsError => ex
    # I'm going to ignore this and just overwrite the files.
    
  rescue => ex
    puts ex
    
  end


  def import
    @gtfs_source = GtfsSource.find(params[:gtfs_source_id])
    p @gtfs_source.url

    target = File.dirname(__FILE__) + '/../../test/fixtures/gtfs/';
    target_out = target + "/" + @gtfs_source.id + "/"
    local_filename=  target + @gtfs_source.id + "download.zip"
    Dir.mkdir(target) unless File.exists? target
    Dir.mkdir(target_out) unless File.exists? target

    if (!File.exists? local_filename)
      r = Net::HTTP.get_response(URI.parse(url).host, URI.parse(url).path)
      File.open("local_filename",'w') {|f|
        f.write(r.body)
      }      
      
      Archive::Zip.extract(local_filename, target_out)
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
