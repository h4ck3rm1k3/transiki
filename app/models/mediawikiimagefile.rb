class Mediawikiimagefile < ActiveRecord::Base
# this stores the geotagged function
#  
  require "gen_geo_tag"

  def log (message)
    print "LOG:" + message + "\n";
  end

  def geturl (url,local_filename)
    data = ""
    log( "going to get " + url)
    url = URI.encode(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host)
    http.start do |http|     
      tmpurl = uri.path

      # does it have a query
      if (uri.query)
        tmpurl = tmpurl+ "?" + uri.query
      end
      req = Net::HTTP::Get.new(tmpurl,    {"User-Agent" =>   "flossk.org User:MdupontBot 0.1 image tagger tool"} )    
      res = http.request(req)        
      File.open(local_filename,'w') {|f|
        data =res.body
        f.write(data)
      }                  
      return data
    end
  end
  
  def genfilename (idtoget,basename)
    target = File.dirname(__FILE__) + '/../../test/fixtures/mediawiki/imagefiles/';
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
      log( "going to read " +  local_filename)
      File.open(local_filename,'r') {|f|
        return f.read()
      }
    else
      return nil
    end
  end
  
  def getdata (url,idtoget)
#    p "getdata"
    @pagecount = 1
    name = @pagecount.to_s
    log( "getdata" + name)
    local_filename=genfilename(idtoget.to_s,name)
    log("created local file" + local_filename)
    data = cachepage(local_filename) # look up the page
    if (data == nil) # no data and then get it if not 
      data=geturl(url,local_filename)
    else
      # we have gotten the data already
    end # end do http

    return data
  end 

  def api (curid, baseurl)
    log("api" + baseurl )
    jsondata= getdata("http://commons.wikimedia.org/w/api.php?" + baseurl, curid)
  end

  def pull (imagename)
    
    jsondata= api(id.to_s, "action=query&titles=" + imagename + "&prop=imageinfo&format=json&iiprop=timestamp|user|comment|url|size|dimensions|sha1|mime|metadata|archivename|bitdepth&iiurlwidth=120px")
    info= JSON.parse(jsondata)
    info["query"]["pages"].each {|imageid, image|
      if image["imageinfo"]
        if image["imageinfo"][0]
          if image["imageinfo"][0]["thumburl"]
            self.description=jsondata
            self.imageurl=image["imageinfo"][0]["url"]
            self.imagethumb=image["imageinfo"][0]["thumburl"]
            self.save
            else
            p "nothing"
          end
        else
          p "nothing"          
        end
      else
        p "nothing"        
      end
    }
  end


  def create_geotag
    idtoget = params[:id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)
    newpoint = nil
    # lets look up 
    pt = PointTag.where(:key => "mediawikiimagefile_id",
                   :value => @mediawikiimagefile.id.to_s).first
    
    if (pt)
      # found 
      @point =pt.point()
      newpoint = params["point"]
      if(newpoint ) 
        # we have a post, lets save it.
        @point.latitude=newpoint["latitude"]
        @point.longitude=newpoint["longitude"]
        @point.save
      end
    end
  end

  def geotag

    #
    newpoint = nil

    # lets look up a point tag based on our id, it is converted to a string and stored in a class 
    # 
    pt = PointTag.where(:key => "mediawikiimagefile_id",
                   :value => self.id.to_s).first

    if (pt)
      p "Found:"
      p pt
      @point =pt.point()
      p @point
      
    else
      newpoint = params["point"]
      if(newpoint ) 
        # we have a post, lets save it.
        @point=Point.new(newpoint)
        @point.save
        pt = PointTag.new
        pt.point_id=@point.id
        pt.key = "mediawikiimagefile_id"
        pt.value = @mediawikiimagefile.id
        pt.save
      else
        # to store the point and to fill it out.
        @point = Point.new
        @point.latitude=0
        @point.longitude=0
      end
    end
  end


  # GET /mediawikiimagefiles/1
  # GET /mediawikiimagefiles/1.xml
  
end
