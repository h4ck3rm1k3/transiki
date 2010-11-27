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
