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

  def geturl (url,local_filename)
    data = ""
    p "going to get " + url
    url = URI.encode(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host)
    http.start do |http|     
      req = Net::HTTP::Get.new(uri.path + "?" + uri.query,    {"User-Agent" =>   "flossk.org User:MdupontBot 0.1 image tagger tool"} )    
      res = http.request(req)        
      File.open(local_filename,'w') {|f|
        data =res.body
        f.write(data)
      }                  
      return data
    end
  end
  
  def genfilename (idtoget,basename)
    target = File.dirname(__FILE__) + '/../../test/fixtures/mediawiki/';
    target_out = target +  idtoget + "/"
    local_filename=  target_out + basename + ".txt"
    Dir.mkdir(target) unless File.exists? target
    Dir.mkdir(target_out) unless File.exists? target_out
    return local_filename
  end

  def cachepage (local_filename)
    data = "NOTHING"
    if (File.exists? local_filename)
      #get the existing data
      p "going to read " +  local_filename
      File.open(local_filename,'r') {|f|
        return f.read()
      }
    else
      return nil
    end
  end
  
  def getdata (url,idtoget)
    p "getdata"
    @pagecount = @pagecount +  1
    p @pagecount
    name = @pagecount.to_s
    p name
    local_filename=genfilename(idtoget.to_s,name)
    p local_filename
    data = cachepage(local_filename)
    if (data == nil)
      data=geturl(url,local_filename)

    else
      p "read data"

    end# end do http

    
    return data
  end 

  def getnext (objs,idtoget,catname)
    if (objs != nil)
      if objs["query-continue"]
        if objs["query-continue"]["categorymembers"]
          if objs["query-continue"]["categorymembers"]["cmcontinue"]
            nextpage=objs["query-continue"]["categorymembers"]["cmcontinue"]
            @titles << "NEXT PAGE "  + nextpage
            end
        end
      end
      if (nextpage)     
        nexturl = "http://commons.wikimedia.org/w/api.php?cmprop=title|ids|sortkey|timestamp&cmcontinue=" +nextpage+ "&format=json&list=categorymembers&cmlimit=500&action=query&cmtitle=Category:" + catname
        data=getdata(nexturl,idtoget)
        parsejsoncategory(idtoget,data,catname)
      else
        p "no next page"
      end
    else
      p "no data"
    end
  end

  def parsejsoncategory (idtoget,jsondata,catname)

    @titles << "START OF PAGE " +  @pagecount.to_s
    if (jsondata)
      objs = JSON.parse(jsondata)
      objs["query"]["categorymembers"].each {|arrayval| 
        @titles << arrayval["title"] 

        # now we create a simple entry for it, we can pull more data for each one individually
        @mediawikiimagefile = Mediawikiimagefile.new
        @mediawikiimagefile.mediawikiserver_id=@mediawikicategory.mediawikiserver_id
        @mediawikiimagefile.name=arrayval["title"]
        @mediawikiimagefile.save
#        mediawikiimagefiles.
        # example :
        #pageid":12043600
        #"ns":6
        #"title":"File:SinanPasha.JPG"
        #"sortkey":"File:SinanPasha.JPG"
        #"timestamp":"2010-11-13T18:01:36Z"
      }
      getnext(objs,idtoget,catname)
    else
      p "no data!"
      @titles << "NO DATA" 
    end
  end

  def importimagefiles
    idtoget = params[:mediawikicategory_id].to_s
    @titles = [] # clear the list
    @pagecount =0
    data = nil
    data = cachepage(idtoget)
    if (data == nil)
      @mediawikicategory = Mediawikicategory.find(idtoget)
      url = "http://commons.wikimedia.org/w/api.php?cmprop=title|ids|sortkey|timestamp&format=json&list=categorymembers&cmlimit=500&action=query&cmtitle=Category:" + @mediawikicategory.name
      data= getdata(url,idtoget)
    end# end do http
    parsejsoncategory(idtoget,data,@mediawikicategory.name)
    
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
