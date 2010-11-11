class GoogleSheetsController < ApplicationController
#  helper :all 

  # GET /google_sheets
  # GET /google_sheets.xml
  def index
    @google_sheets = GoogleSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @google_sheets }
    end
  end

  def loadgdata
    @google_sheet = GoogleSheet.find(params[:google_sheet_id])
    @table = Array.new
    @preheaderrow=Array.new
    @headerrowkeys=Array.new # sorted array of the keys in the right order.. we hope
    url = "http://spreadsheets.google.com/feeds/cells/" + @google_sheet.key + "/od6/public/basic"
    @client = GData::Client::Spreadsheets.new({})
    @feed = @client.get(url)
    @xml = Nokogiri::XML.parse(@feed.body)  
    row = 0 # the current row
    cells = Hash.new # current row data as hash 
    @xml.css('entry').each do |e|
      title=e.search('title').first.content
      cnt = e.search('content').first().content
      if (title =~ /^([A-Z]*)(\d*)$/) 
        ccol=$1;
        crow=$2.to_i;  # conver directly to integer

        if (row != crow )# end of a row, collect all the data and put it somewhere
            if (@google_sheet.headerrow)  # if there is a header row defined, split by it
              if (row <  @google_sheet.headerrow) # before the header row
                if (row > 0) # and not the fist empty row
                  @preheaderrow.push(cells) # push the row into the header row.                  
                end                  # skip row 0... no data.
              else
                #not before header row
                if (row ==  @google_sheet.headerrow)
                  # put the keys in sorted order
                  cells.keys.sort.each { |key| @headerrowkeys.push key}
                  @headerrow=cells
                else                  
                  @table.push(cells) # after the header row,  add all rows to the table
                end            
              end
            else
              @table.push(cells)               # no header row, just add all 
            end

          row=crow # convert the string to intgere
          cells['_row']=row
#          p cells 
          cells=Hash.new # create a new has for the new fow

        end # new row
      end # if title

      # append the data to a new row
      cells[ccol]= cnt
    end # each entry
    
  end
  def import
    # we generate a scaffold 
    loadgdata

#    @headerrowkeys.each do |key|      @headerrow[key]     end 
    
    @table.each do |row| 
      # create a new 
    @object = eval(@googlesheet.classname + ".new(row)")
      @google_sheet.update_attributes(row)
      @headerrowkeys.each do |key| 
        @object.Parse(key,row[key] )
      end 
    end 
    @object.save

  end

  def scaffold
    # we generate a scaffold 
    loadgdata

    respond_to do |format|
      format.html { render :action => "scaffold" } 
    end
  end

  def parse
    loadgdata
    
    respond_to do |format|
      format.html { render :action => @google_sheet.name } 
      format.xml  { render :xml => @google_sheets }      
    end	

  rescue GData::Client::BadRequestError => bang 
    begin
        print "Error running script: " + bang 
        return false
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
