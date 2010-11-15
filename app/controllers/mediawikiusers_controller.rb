class MediawikiusersController < ApplicationController
  # GET /mediawikiusers
  # GET /mediawikiusers.xml
  def index
    @mediawikiusers = Mediawikiuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediawikiusers }
    end
  end

  # GET /mediawikiusers/1
  # GET /mediawikiusers/1.xml
  def show
    @mediawikiuser = Mediawikiuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediawikiuser }
    end
  end

  # GET /mediawikiusers/new
  # GET /mediawikiusers/new.xml
  def new
    @mediawikiuser = Mediawikiuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mediawikiuser }
    end
  end

  # GET /mediawikiusers/1/edit
  def edit
    @mediawikiuser = Mediawikiuser.find(params[:id])
  end

  # POST /mediawikiusers
  # POST /mediawikiusers.xml
  def create
    @mediawikiuser = Mediawikiuser.new(params[:mediawikiuser])

    respond_to do |format|
      if @mediawikiuser.save
        format.html { redirect_to(@mediawikiuser, :notice => 'Mediawikiuser was successfully created.') }
        format.xml  { render :xml => @mediawikiuser, :status => :created, :location => @mediawikiuser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediawikiuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mediawikiusers/1
  # PUT /mediawikiusers/1.xml
  def update
    @mediawikiuser = Mediawikiuser.find(params[:id])

    respond_to do |format|
      if @mediawikiuser.update_attributes(params[:mediawikiuser])
        format.html { redirect_to(@mediawikiuser, :notice => 'Mediawikiuser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mediawikiuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mediawikiusers/1
  # DELETE /mediawikiusers/1.xml
  def destroy
    @mediawikiuser = Mediawikiuser.find(params[:id])
    @mediawikiuser.destroy

    respond_to do |format|
      format.html { redirect_to(mediawikiusers_url) }
      format.xml  { head :ok }
    end
  end
end
