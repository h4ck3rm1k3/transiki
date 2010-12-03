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
#     idtoget = 
    idtoget = params[:mediawikiimagefile_id] || params[:id]

     @mediawikiimagefile = Mediawikiimagefile.find(idtoget)

    # TODO   b@mediawikiimagefile.geota
    newpoint = params["point"]
    
    defaultpoint = Point.new
    defaultpoint.latitude = cookies[:last_latitude]  || 0
    defaultpoint.longitude = cookies[:last_longitude] || 0

    @point = @mediawikiimagefile.geotag(newpoint,defaultpoint)

    cookies[:last_latitude]  = @point.latitude
    cookies[:last_longitude] = @point.longitude
    
  end

  def geotag
    idtoget = params[:mediawikiimagefile_id]
    @mediawikiimagefile = Mediawikiimagefile.find(idtoget)

    # TODO   b@mediawikiimagefile.geota
    newpoint = params["point"]

    defaultpoint = Point.new
    defaultpoint.latitude = cookies[:last_latitude]  || 0
    defaultpoint.longitude = cookies[:last_longitude] || 0

    @point = @mediawikiimagefile.geotag(newpoint,defaultpoint)

    cookies[:last_latitude]  = @point.latitude
    cookies[:last_longitude] = @point.longitude

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

end

