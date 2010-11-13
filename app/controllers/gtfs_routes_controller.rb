class GtfsRoutesController < ApplicationController
  # GET /gtfs_routes
  # GET /gtfs_routes.xml
  def index
    @gtfs_routes = GtfsRoute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_routes }
    end
  end

  # GET /gtfs_routes/1
  # GET /gtfs_routes/1.xml
  def show
    @gtfs_route = GtfsRoute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_route }
    end
  end

  # GET /gtfs_routes/new
  # GET /gtfs_routes/new.xml
  def new
    @gtfs_route = GtfsRoute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_route }
    end
  end

  # GET /gtfs_routes/1/edit
  def edit
    @gtfs_route = GtfsRoute.find(params[:id])
  end

  # POST /gtfs_routes
  # POST /gtfs_routes.xml
  def create
    @gtfs_route = GtfsRoute.new(params[:gtfs_route])

    respond_to do |format|
      if @gtfs_route.save
        format.html { redirect_to(@gtfs_route, :notice => 'Gtfs route was successfully created.') }
        format.xml  { render :xml => @gtfs_route, :status => :created, :location => @gtfs_route }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_routes/1
  # PUT /gtfs_routes/1.xml
  def update
    @gtfs_route = GtfsRoute.find(params[:id])

    respond_to do |format|
      if @gtfs_route.update_attributes(params[:gtfs_route])
        format.html { redirect_to(@gtfs_route, :notice => 'Gtfs route was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_routes/1
  # DELETE /gtfs_routes/1.xml
  def destroy
    @gtfs_route = GtfsRoute.find(params[:id])
    @gtfs_route.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_routes_url) }
      format.xml  { head :ok }
    end
  end
end
