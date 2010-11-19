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
    idtoget = params[:mediawikiimagefile_id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)

    newpoint = nil

    # lets look up 
    pt = PointTag.where(:key => "mediawikiimagefile_id",
                   :value => @mediawikiimagefile.id.to_s).first

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

  def pull 
    idtoget = params[:mediawikiimagefile_id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)
    @mediawikiimagefile.pull
  end

  # GET /mediawikiimagefiles/1
  # GET /mediawikiimagefiles/1.xml
  def show
    @mediawikiimagefile = Mediawikiimagefile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikiimagefile }
    end
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
end
