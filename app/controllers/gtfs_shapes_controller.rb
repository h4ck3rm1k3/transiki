class GtfsShapesController < ApplicationController
  # GET /gtfs_shapes
  # GET /gtfs_shapes.xml
  def index
    @gtfs_shapes = GtfsShape.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gtfs_shapes }
    end
  end

  # GET /gtfs_shapes/1
  # GET /gtfs_shapes/1.xml
  def show
    @gtfs_shape = GtfsShape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gtfs_shape }
    end
  end

  # GET /gtfs_shapes/new
  # GET /gtfs_shapes/new.xml
  def new
    @gtfs_shape = GtfsShape.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gtfs_shape }
    end
  end

  # GET /gtfs_shapes/1/edit
  def edit
    @gtfs_shape = GtfsShape.find(params[:id])
  end

  # POST /gtfs_shapes
  # POST /gtfs_shapes.xml
  def create
    @gtfs_shape = GtfsShape.new(params[:gtfs_shape])

    respond_to do |format|
      if @gtfs_shape.save
        format.html { redirect_to(@gtfs_shape, :notice => 'Gtfs shape was successfully created.') }
        format.xml  { render :xml => @gtfs_shape, :status => :created, :location => @gtfs_shape }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gtfs_shape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gtfs_shapes/1
  # PUT /gtfs_shapes/1.xml
  def update
    @gtfs_shape = GtfsShape.find(params[:id])

    respond_to do |format|
      if @gtfs_shape.update_attributes(params[:gtfs_shape])
        format.html { redirect_to(@gtfs_shape, :notice => 'Gtfs shape was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gtfs_shape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gtfs_shapes/1
  # DELETE /gtfs_shapes/1.xml
  def destroy
    @gtfs_shape = GtfsShape.find(params[:id])
    @gtfs_shape.destroy

    respond_to do |format|
      format.html { redirect_to(gtfs_shapes_url) }
      format.xml  { head :ok }
    end
  end
end
