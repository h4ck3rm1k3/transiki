class GarminIdsController < ApplicationController
  # GET /garmin_ids
  # GET /garmin_ids.xml
  def index
    @garmin_ids = GarminId.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @garmin_ids }
    end
  end

  # GET /garmin_ids/1
  # GET /garmin_ids/1.xml
  def show
    @garmin_id = GarminId.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @garmin_id }
    end
  end

  # GET /garmin_ids/new
  # GET /garmin_ids/new.xml
  def new
    @garmin_id = GarminId.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @garmin_id }
    end
  end

  # GET /garmin_ids/1/edit
  def edit
    @garmin_id = GarminId.find(params[:id])
  end

  # POST /garmin_ids
  # POST /garmin_ids.xml
  def create
    @garmin_id = GarminId.new(params[:garmin_id])

    respond_to do |format|
      if @garmin_id.save
        format.html { redirect_to(@garmin_id, :notice => 'Garmin was successfully created.') }
        format.xml  { render :xml => @garmin_id, :status => :created, :location => @garmin_id }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @garmin_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /garmin_ids/1
  # PUT /garmin_ids/1.xml
  def update
    @garmin_id = GarminId.find(params[:id])

    respond_to do |format|
      if @garmin_id.update_attributes(params[:garmin_id])
        format.html { redirect_to(@garmin_id, :notice => 'Garmin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @garmin_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /garmin_ids/1
  # DELETE /garmin_ids/1.xml
  def destroy
    @garmin_id = GarminId.find(params[:id])
    @garmin_id.destroy

    respond_to do |format|
      format.html { redirect_to(garmin_ids_url) }
      format.xml  { head :ok }
    end
  end
end
