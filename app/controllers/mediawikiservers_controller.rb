class MediawikiserversController < ApplicationController
  # GET /mediawikiservers
  # GET /mediawikiservers.xml
  def index
    @mediawikiservers = Mediawikiserver.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediawikiservers }
    end
  end

  # GET /mediawikiservers/1
  # GET /mediawikiservers/1.xml
  def show
    @mediawikiserver = Mediawikiserver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikiserver }
    end
  end

  # GET /mediawikiservers/new
  # GET /mediawikiservers/new.xml
  def new
    @mediawikiserver = Mediawikiserver.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mediawikiserver }
    end
  end

  # GET /mediawikiservers/1/edit
  def edit
    @mediawikiserver = Mediawikiserver.find(params[:id])
  end

  # POST /mediawikiservers
  # POST /mediawikiservers.xml
  def create
    @mediawikiserver = Mediawikiserver.new(params[:mediawikiserver])

    respond_to do |format|
      if @mediawikiserver.save
        format.html { redirect_to(@mediawikiserver, :notice => 'Mediawikiserver was successfully created.') }
        format.xml  { render :xml => @mediawikiserver, :status => :created, :location => @mediawikiserver }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediawikiserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mediawikiservers/1
  # PUT /mediawikiservers/1.xml
  def update
    @mediawikiserver = Mediawikiserver.find(params[:id])

    respond_to do |format|
      if @mediawikiserver.update_attributes(params[:mediawikiserver])
        format.html { redirect_to(@mediawikiserver, :notice => 'Mediawikiserver was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mediawikiserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mediawikiservers/1
  # DELETE /mediawikiservers/1.xml
  def destroy
    @mediawikiserver = Mediawikiserver.find(params[:id])
    @mediawikiserver.destroy

    respond_to do |format|
      format.html { redirect_to(mediawikiservers_url) }
      format.xml  { head :ok }
    end
  end
end
