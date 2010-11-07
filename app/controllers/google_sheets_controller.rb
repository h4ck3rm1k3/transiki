class GoogleSheetsController < ApplicationController
  # GET /google_sheets
  # GET /google_sheets.xml
  def index
    @google_sheets = GoogleSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @google_sheets }
    end
  end

  # GET /google_sheets/1
  # GET /google_sheets/1.xml
  def show
    @google_sheet = GoogleSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @google_sheet }
    end
  end

  # GET /google_sheets/new
  # GET /google_sheets/new.xml
  def new
    @google_sheet = GoogleSheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @google_sheet }
    end
  end

  # GET /google_sheets/1/edit
  def edit
    @google_sheet = GoogleSheet.find(params[:id])
  end

  # POST /google_sheets
  # POST /google_sheets.xml
  def create
    @google_sheet = GoogleSheet.new(params[:google_sheet])

    respond_to do |format|
      if @google_sheet.save
        format.html { redirect_to(@google_sheet, :notice => 'Google sheet was successfully created.') }
        format.xml  { render :xml => @google_sheet, :status => :created, :location => @google_sheet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @google_sheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /google_sheets/1
  # PUT /google_sheets/1.xml
  def update
    @google_sheet = GoogleSheet.find(params[:id])

    respond_to do |format|
      if @google_sheet.update_attributes(params[:google_sheet])
        format.html { redirect_to(@google_sheet, :notice => 'Google sheet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @google_sheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /google_sheets/1
  # DELETE /google_sheets/1.xml
  def destroy
    @google_sheet = GoogleSheet.find(params[:id])
    @google_sheet.destroy

    respond_to do |format|
      format.html { redirect_to(google_sheets_url) }
      format.xml  { head :ok }
    end
  end
end
