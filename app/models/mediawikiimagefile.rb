class Mediawikiimagefile < ActiveRecord::Base

  def geturl (url,local_filename)
    data = ""
#    p "going to get " + url
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
#      p "going to read " +  local_filename
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
#    p name
    local_filename=genfilename(idtoget.to_s,name)
#    p local_filename
    data = cachepage(local_filename)
    if (data == nil)
      data=geturl(url,local_filename)

    else
#      p "read data"

    end# end do http

    
    return data
  end 

  def api (curid, baseurl)
#    p baseurl 
    jsondata= getdata("http://commons.wikimedia.org/w/api.php?" + baseurl, curid)
  end

  def pull 
    jsondata= api(id.to_s, "action=query&titles=" + name + "&prop=imageinfo&format=json&iiprop=timestamp|user|comment|url|size|dimensions|sha1|mime|metadata|archivename|bitdepth&iiurlwidth=120px")
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
  
end
