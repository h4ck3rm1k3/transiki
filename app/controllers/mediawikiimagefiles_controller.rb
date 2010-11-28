class MediawikiimagefilesController < ApplicationController
  # GET /mediawikiimagefiles
  # GET /mediawikiimagefiles.xml
  def index
    @mediawikiimagefiles = Mediawikiimagefile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediawikiimagefiles }
    end
  end

  #          mediawikiimagefile_pull GET    /mediawikiimagefiles/:mediawikiimagefile_id/pull(.:format)            {:controller=>"mediawikiimagefiles", :action=>"pull"}

  #        mediawikiimagefile_geotag GET    /mediawikiimagefiles/:mediawikiimagefile_id/geotag(.:format)          {:controller=>"mediawikiimagefiles", :action=>"geotag"}
  # mediawikiimagefile_create_geotag POST   /mediawikiimagefiles/:mediawikiimagefile_id/create_geotag(.:format)   {:controller=>"mediawikiimagefiles", :action=>"create_geotag"}
  # create_geotag_mediawikiimagefile PUT    /mediawikiimagefiles/:id/create_geotag(.:format)                      {:controller=>"mediawikiimagefiles", :action=>"create_geotag"}


  #        mediawikiimagefile_import GET    /mediawikiimagefiles/:mediawikiimagefile_id/import(.:format)          {:controller=>"mediawikiimagefiles", :action=>"import"}
  #              mediawikiimagefiles GET    /mediawikiimagefiles(.:format)                                        {:controller=>"mediawikiimagefiles", :action=>"index"}
  #              mediawikiimagefiles POST   /mediawikiimagefiles(.:format)                                        {:controller=>"mediawikiimagefiles", :action=>"create"}
  #           new_mediawikiimagefile GET    /mediawikiimagefiles/new(.:format)                                    {:controller=>"mediawikiimagefiles", :action=>"new"}
  #          edit_mediawikiimagefile GET    /mediawikiimagefiles/:id/edit(.:format)                               {:controller=>"mediawikiimagefiles", :action=>"edit"}
  #               mediawikiimagefile GET    /mediawikiimagefiles/:id(.:format)                                    {:controller=>"mediawikiimagefiles", :action=>"show"}
  #               mediawikiimagefile PUT    /mediawikiimagefiles/:id(.:format)                                    {:controller=>"mediawikiimagefiles", :action=>"update"}
  #               mediawikiimagefile DELETE /mediawikiimagefiles/:id(.:format)                                    {:controller=>"mediawikiimagefiles", :action=>"destroy"}

  def geotag
    idtoget = params[:mediawikiimagefile_id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)

    # TODO   b@mediawikiimagefile.geota
    newpoint = params["point"]

    @point = @mediawikiimagefile.geotag(newpoint)

  end

  def show
    @mediawikiimagefile = Mediawikiimagefile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikiimagefile }
    end
  end

  def pull 
    idtoget = params[:mediawikiimagefile_id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)
    @mediawikiimagefile.pull
  end

  # GET /mediawikiimagefiles/new
  # GET /mediawikiimagefiles/new.xml
  def new
    @mediawikiimagefile = Mediawikiimagefile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mediawikiimagefile }
    end
  end

  # GET /mediawikiimagefiles/1/edit
  def edit
    @mediawikiimagefile = Mediawikiimagefile.find(params[:id])
  end

  # POST /mediawikiimagefiles
  # POST /mediawikiimagefiles.xml
  def create
    @mediawikiimagefile = Mediawikiimagefile.new(params[:mediawikiimagefile])

    respond_to do |format|
      if @mediawikiimagefile.save
        format.html { redirect_to(@mediawikiimagefile, :notice => 'Mediawikiimagefile was successfully created.') }
        format.xml  { render :xml => @mediawikiimagefile, :status => :created, :location => @mediawikiimagefile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediawikiimagefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mediawikiimagefiles/1
  # PUT /mediawikiimagefiles/1.xml
  def update
    @mediawikiimagefile = Mediawikiimagefile.find(params[:id])

    respond_to do |format|
      if @mediawikiimagefile.update_attributes(params[:mediawikiimagefile])
        format.html { redirect_to(@mediawikiimagefile, :notice => 'Mediawikiimagefile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mediawikiimagefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mediawikiimagefiles/1
  # DELETE /mediawikiimagefiles/1.xml
  def destroy
    @mediawikiimagefile = Mediawikiimagefile.find(params[:id])
    @mediawikiimagefile.destroy

    respond_to do |format|
      format.html { redirect_to(mediawikiimagefiles_url) }
      format.xml  { head :ok }
    end
  end



################
#TODO
#   def create_geotag
#     idtoget = params[:id]
#     @mediawikiimagefile = Mediawikiimagefile.find(idtoget)
#     newpoint = nil

#     # lets look up
#     pt = PointTag.where(:key => "mediawikiimagefile_id",
#                    :value => @mediawikiimagefile.id.to_s).first
    
#     if (pt)
#       p "Found:"
#       p pt
#       @point =pt.point()
#       p @point

# #"commit"=>"Update Point",
# # "authenticity_token"=>"OKGT0Wc88EVlsyyWL6blXFFZi2lVNpXkPoUkEXl0nLk=",
# # "_method"=>"put",
# # "utf8"=>"✓",
# # "point"=>{"latitude"=>"-0.0018453598018566",
# # "id"=>"33",
# # "longitude"=>"-0.008239746093421"},
# # "id"=>"59"
#       newpoint = params["point"]
#       if(newpoint )
#         # we have a post, lets save it.
#         @point.latitude=newpoint["latitude"]
#         @point.longitude=newpoint["longitude"]
#         @point.save
#       end
#     end

    
#   end
  
#   def geotag
#     idtoget = params[:mediawikiimagefile_id]
#     @mediawikiimagefile = Mediawikiimagefile.find(idtoget)

#     newpoint = nil

#     # lets look up
#     pt = PointTag.where(:key => "mediawikiimagefile_id",
#                    :value => @mediawikiimagefile.id.to_s).first

#     if (pt)
#       p "Found:"
#       p pt
#       @point =pt.point()
#       p @point
      
#     else
#       newpoint = params["point"]
#       if(newpoint )
#         # we have a post, lets save it.
#         @point=Point.new (newpoint)
#         @point.save
#         pt = PointTag.new
#         pt.point_id=@point.id
#         pt.key = "mediawikiimagefile_id"
#         pt.value = @mediawikiimagefile.id
#         pt.save
#       else
#         # to store the point and to fill it out.
#         @point = Point.new
#         @point.latitude=0
#         @point.longitude=0
#       end
#     end
#   end

#   def pull
#     idtoget = params[:mediawikiimagefile_id]
#     #
#     @mediawikiimagefile = Mediawikiimagefile.find(idtoget)
#     #iiurlwidth / iiurlheight
#     jsondata= api(@mediawikiimagefile.id.to_s, "action=query&titles=" + @mediawikiimagefile.name + "&prop=imageinfo&format=json&iiprop=timestamp|user|comment|url|size|dimensions|sha1|mime|metadata|archivename|bitdepth&iiurlwidth=120px")
#     info= JSON.parse(jsondata)

# # p "Info:"
# # p info
# # p "Query:"
# # p info["query"]
#     #["pages"]
#     info["query"]["pages"].each {|imageid, image|
# # p image
#       # we expect only one
#       @thumb = image["imageinfo"][0]["thumburl"]
#       @imageurl = image["imageinfo"][0]["url"]
#       @mediawikiimagefile.description=jsondata
#       @mediawikiimagefile.imageurl=@imageurl
#       @mediawikiimagefile.imagethumb=@thumb
#       @mediawikiimagefile.save
# # p @thumb
#       #thumburl
#     }

# # {
# # "query" : {
# # "pages" : {
# # "12053717" : {
# # "ns" : 6,
# # "pageid" : 12053717,
#     # "imageinfo" : [
# # {
# # "width" : 1616,
# # "sha1" : "064d5c9b8a031e25787eb5b8b8c5cea406c530f7",
# # "thumbheight" : 113,
# # "descriptionurl" : "http://commons.wikimedia.org/wiki/File:BesfortPicturesForWikimedia100_3950.JPG",
# # "thumbwidth" : 120,
# # "height" : 1520,
# # "size" : 529230,
# # "bitdepth" : 8,
# # "comment" : "Submission for the best picture of kosovo for wikipedia contest from Bestfort Guri, see archive.org files here : http://www.archive.org/details/BesfortPicturesForWikimedia",
# # "timestamp" : "2010-11-14T20:19:27Z",
# # "user" : "MdupontBot",
# # "url" : "http://upload.wikimedia.org/wikipedia/commons/a/a0/BesfortPicturesForWikimedia100_3950.JPG",
# # "metadata" : [
# # {
# # "value" : "EASTMAN KODAK COMPANY",
# # "name" : "Make"
# # },
# # {
# # "value" : "KODAK EASYSHARE C533 ZOOM DIGITAL CAMERA",
# # "name" : "Model"
# # },
# # {
# # "value" : 2,
# # "name" : "YCbCrPositioning"
# # },
# # {
# # "value" : "1/90",
# # "name" : "ExposureTime"
# # },
# # {
# # "value" : "40/10",
# # "name" : "FNumber"
# # },
# # {
# # "value" : 2,
# # "name" : "ExposureProgram"
# # },
# # {
# # "value" : 80,
# # "name" : "ISOSpeedRatings"
# # },
# # {
# # "value" : "0221",
# # "name" : "ExifVersion"
# # },
# # {
# # "value" : "2008:06:16 19:46:29",
# # "name" : "DateTimeOriginal"
# # },
# # {
# # "value" : "2008:06:16 19:46:29",
# # "name" : "DateTimeDigitized"
# # },
# # {
# # "value" : "65/10",
# # "name" : "ShutterSpeedValue"
# # },
# # {
# # "value" : "40/10",
# # "name" : "ApertureValue"
# # },
# # {
# # "value" : "0/10",
# # "name" : "ExposureBiasValue"
# # },
# # {
# # "value" : "39/10",
# # "name" : "MaxApertureValue"
# # },
# # {
# # "value" : 2,
# # "name" : "MeteringMode"
# # },
# # {
# # "value" : 0,
# # "name" : "LightSource"
# # },
# # {
# # "value" : 25,
# # "name" : "Flash"
# # },
# # {
# # "value" : "116/10",
# # "name" : "FocalLength"
# # },
# # {
# # "value" : 1,
# # "name" : "ColorSpace"
# # },
# # {
# # "value" : "80/1",
# # "name" : "ExposureIndex"
# # },
# # {
# # "value" : 2,
# # "name" : "SensingMethod"
# # },
# # {
# # "value" : 0,
# # "name" : "CustomRendered"
# # },
# # {
# # "value" : 0,
# # "name" : "ExposureMode"
# # },
# # {
# # "value" : 0,
# # "name" : "WhiteBalance"
# # },
# # {
# # "value" : "0/100",
# # "name" : "DigitalZoomRatio"
# # },
# # {
# # "value" : 70,
# # "name" : "FocalLengthIn35mmFilm"
# # },
# # {
# # "value" : 0,
# # "name" : "SceneCaptureType"
# # },
# # {
# # "value" : 0,
# # "name" : "Contrast"
# # },
# # {
# # "value" : 0,
# # "name" : "Saturation"
# # },
# # {
# # "value" : 0,
# # "name" : "Sharpness"
# # },
# # {
# # "value" : 1,
# # "name" : "SubjectDistanceRange"
# # },
# # {
# # "value" : 1,
# # "name" : "MEDIAWIKI_EXIF_VERSION"
# # }
# # ],
# # "thumburl" : "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/BesfortPicturesForWikimedia100_3950.JPG/120px-BesfortPicturesForWikimedia100_3950.JPG",
# # "mime" : "image/jpeg"
# # }
# # ],
# # "imagerepository" : "local",
# # "title" : "File:BesfortPicturesForWikimedia100 3950.JPG"
# # }
# # }
# # }
# # }

end

