class Mediawikicategory < ActiveRecord::Base

  # def geturl (url,local_filename)
  #   data = ""
  #   p "going to get " + url
  #   url = URI.encode(url)
  #   uri = URI.parse(url)
  #   http = Net::HTTP.new(uri.host)
  #   http.start do |http|     
  #     req = Net::HTTP::Get.new(uri.path + "?" + uri.query,    {"User-Agent" =>   "flossk.org User:MdupontBot 0.1 image tagger tool"} )    
  #     res = http.request(req)        
  #     File.open(local_filename,'w') {|f|
  #       data =res.body
  #       f.write(data)
  #     }                  
  #     return data
  #   end
  # end
  
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
      data= geturl(url,local_filename)

    else
      p "read data"

    end# end do http

    
    return data
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
        @mediawikiimagefile.mediawikicategory_id=@mediawikicategory.id
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

  def pull
    #
    idtoget = params[:mediawikicategory_id].to_s
    @mediawikicategory = Mediawikicategory.find(idtoget)
    @titles = [] # clear the list
    
    # now pull all the pages from this category 
    @mediawikiimagefiles = Mediawikiimagefile.where(:mediawikicategory_id => params[:mediawikicategory_id])
    @mediawikiimagefiles.each {|image|
      errorcode= image.pull
      
      if (errorcode == 0)
        p "OK"
      else
        p errorcode
      end
      @titles << image
    }

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

  # gets the next set of data
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

        #calls get data
        data=getdata(nexturl,idtoget)
        parsejsoncategory(idtoget,data,catname)
      else
        p "no next page"
      end
    else
      p "no data"
    end
  end

end
