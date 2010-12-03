class Mediawikiimagefile < ActiveRecord::Base
# this stores the geotagged function
#  
  require "gen_geo_tag"

  def log (message)
    print "LOG:" + message + "\n";
  end

  def logv (name, message)
    if (message)
      print "LOG:" + name + ":"
      p message 
      print "\n";
    else
      print "LOG:" + name + ":NULL\n";
    end
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


  def geotag(newpoint, defaultpoint)

    logv("newpoint",newpoint)
    g = GenGeoTag.new()
    p "running geotag"
    logv("mediawiki image file self", self)
    logv("mediawiki image file self id",self.id)

    point = g.create_point_geotag(Mediawikiimagefile,self.id, newpoint, defaultpoint)

    logv("geotag returned point",point)

    return point 

  end



  # GET /mediawikiimagefiles/1
  # GET /mediawikiimagefiles/1.xml
  
end
