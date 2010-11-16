class MediawikicategoriesController < ApplicationController
  require 'json'
#  require 'json/add/rails'
  require 'uri'
  require 'net/http'

  # GET /mediawikicategories
  # GET /mediawikicategories.xml
  def index
    @mediawikicategories = Mediawikicategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediawikicategories }
    end
  end

  def parsejsoncategory(jsondata)
#    p jsondata
    objs = JSON.parse(jsondata)
#    p objs
    @titles = []
    objs["query"]["categorymembers"].each {|arrayval| arrayval.each_key{ |key|  @titles << arrayval["title"] } }
#    p objs
#    objs.each do |O|
#      p O
#    end
    
  end
  def importimagefiles
    idtoget = params[:mediawikicategory_id]
    
    target = File.dirname(__FILE__) + '/../../test/fixtures/mediawiki/';
    target_out = target + "/" + idtoget.to_s + "/"
    local_filename=  target_out + "wikijson.txt"
    Dir.mkdir(target) unless File.exists? target
    Dir.mkdir(target_out) unless File.exists? target_out

    data = "NOTHING"

    if (File.exists? local_filename)
      #get the existing data
      p "going to read " +  local_filename
      File.open(local_filename,'r') {|f|
        data = f.read()
      }
    else
      p idtoget
      @mediawikicategory = Mediawikicategory.find(idtoget)
      p @mediawikicategory
#      maxc = 500
      maxc = 10 
      url = "http://commons.wikimedia.org/w/api.php?cmprop=title|ids|sortkey|timestamp&format=json&list=categorymembers&cmlimit=" + maxc + "&action=query&cmtitle=Category:" + @mediawikicategory.name
      url = URI.encode(url)
      uri = URI.parse(url)
      p uri
      p uri.host
      #    r = Net::HTTP.get_response(uri)
      #    p r    
      http = Net::HTTP.new(uri.host)
      http.start do |http|     
        p "PATH:" + uri.path 
        p "query:" + uri.query
        req = Net::HTTP::Get.new(uri.path + "?" + uri.query,    {"User-Agent" =>   "flossk.org User:MdupontBot 0.1 image tagger tool"} )    
        res = http.request(req)        
        File.open(local_filename,'w') {|f|
          data =res.body
          f.write(data)
        }            
      end# end do http
    end # end else

#    res = Net::HTTP.start(uri.host, uri.port) {|http|
#      http.request(req)
#    }
#    puts res
#    puts res.body
  

#next page example    http://commons.wikimedia.org/w/api.php?cmprop=title|ids|sortkey|timestamp&cmcontinue=File:PrizrenCollection2 2010 100 2714.JPG|&format=json&list=categorymembers&cmlimit=500&action=query&cmtitle=Category:BestPictureOfKosovoForWikipediaContest

    parsejsoncategory(data)
    
    
  end
  
  # GET /mediawikicategories/1
  # GET /mediawikicategories/1.xml
  def show
    @mediawikicategory = Mediawikicategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikicategory }
    end
  end

  # GET /mediawikicategories/new
  # GET /mediawikicategories/new.xml
  def new
    @mediawikicategory = Mediawikicategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mediawikicategory }
    end
  end

  # GET /mediawikicategories/1/edit
  def edit
    @mediawikicategory = Mediawikicategory.find(params[:id])
  end

  # POST /mediawikicategories
  # POST /mediawikicategories.xml
  def create
    @mediawikicategory = Mediawikicategory.new(params[:mediawikicategory])

    respond_to do |format|
      if @mediawikicategory.save
        format.html { redirect_to(@mediawikicategory, :notice => 'Mediawikicategory was successfully created.') }
        format.xml  { render :xml => @mediawikicategory, :status => :created, :location => @mediawikicategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediawikicategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mediawikicategories/1
  # PUT /mediawikicategories/1.xml
  def update
    @mediawikicategory = Mediawikicategory.find(params[:id])

    respond_to do |format|
      if @mediawikicategory.update_attributes(params[:mediawikicategory])
        format.html { redirect_to(@mediawikicategory, :notice => 'Mediawikicategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mediawikicategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mediawikicategories/1
  # DELETE /mediawikicategories/1.xml
  def destroy
    @mediawikicategory = Mediawikicategory.find(params[:id])
    @mediawikicategory.destroy

    respond_to do |format|
      format.html { redirect_to(mediawikicategories_url) }
      format.xml  { head :ok }
    end
  end
end
