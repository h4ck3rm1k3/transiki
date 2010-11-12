class GoogleSheetsController < ApplicationController
#  helper :all 
require 'pp'
#require 'yaml'
  # GET /google_sheets
  # GET /google_sheets.xml
  def index
    @google_sheets = GoogleSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @google_sheets }
    end
  end

  def wikiexport
    #create a wikipage 
  end

  def ymlexport
    #create a yml doc
  end

  def listsheets
    @google_sheet = GoogleSheet.find(params[:google_sheet_id])
    #wget https://spreadsheets.google.com/feeds/worksheets/$1                       /public/basic
    url = "http://spreadsheets.google.com/feeds/worksheets/" + @google_sheet.key + "/public/basic"
    p "going to get url to see" + url
    local_filename= File.dirname(__FILE__) + '/../../test/fixtures/' + @google_sheet.key + "sheets_.xml"
    body = ""
    if (!File.exist?(local_filename))
      @client = GData::Client::Spreadsheets.new({})
      @feed = @client.get(url)
      body=@feed.body
      File.open(local_filename, 'w') {|f| f.write(body) }
    else
      puts "going to read file " + local_filename
      File.open(local_filename, 'r') {|f| body = f.read() }
    end
    @xml = Nokogiri::XML.parse(body)  
#    p @xml
    
  #   DOCUMENT
  #   ELEMENT author
  #   ELEMENT category
  #     ELEMENT category
  #     ELEMENT content
  #     ELEMENT email
  #   ELEMENT entry
  # ELEMENT feed
  #   ELEMENT id
  #     ELEMENT id
  #   ELEMENT link
  #     ELEMENT link
  #     ELEMENT name
  #   ELEMENT openSearch:startIndex
  #   ELEMENT openSearch:totalResults
  #   ELEMENT title
  #     ELEMENT title
  #   ELEMENT updated
  #     ELEMENT updated

    @sheets= [];
    @xml.css('entry').each do |e|
#      p 
#      pp e
#      p e.to_yaml
#      e.
     # #(Element:0x..fdb818f20 {
     #  name = "link",
     #  namespace = #(Namespace:0x..fdb6791d8 {
     #    href = "http://www.w3.org/2005/Atom"
     #    }),
     #  attributes = [
     #    #(Attr:0x..fdb818b60 {     #      name = "rel",     #      value = "http://schemas.google.com/spreadsheets/2006#cellsfeed"
     #      }),
     #    #(Attr:0x..fdb818b56 {      name = "type",     #      value = "application/atom+xml"
     #      }),
     #    #(Attr:0x..fdb818b4c {     #      name = "href",     #      value = "https://spreadsheets.google.com/feeds/cells/0Am70fsptsPF2dENGRWNOQ3lmeU5UbWlORFZTZFpvRWc/odb/public/basic"
     #      })]
     #  }),
 
#      p e.xpath('//name')
#      p e.search('title')
      item ={};
      item["title"] = e.search('title').first.content
      item["src"] = e.search('content').attribute("src").value()
      @sheets.push(item)
#      p e.search('content').attribute("src")
#      p e.search('title').first.content
#      p e.search('category').first.content
#      p e.search('content').first.content
    end

  end

  def loadgdata
#    p "params"
#    p params[:google_sheet_id]
    @google_sheet = GoogleSheet.find(params[:google_sheet_id])

#p "google sheet"
#	p    @google_sheet 

    @table = Array.new
    @preheaderrow=Array.new
    @headerrowkeys=Array.new # sorted array of the keys in the right order.. we hope
    url = "http://spreadsheets.google.com/feeds/cells/" +    @google_sheet.key + "/" +  @google_sheet.sheetname + "/public/basic"

	p url
    local_filename= File.dirname(__FILE__) + '/../../test/fixtures/' +       @google_sheet.key + "_" + @google_sheet.sheetname  + ".xml"

 body = ""
    if (!File.exist?(local_filename))
	    @client = GData::Client::Spreadsheets.new({})
	    @feed = @client.get(url)
         body=@feed.body
	File.open(local_filename, 'w') {|f| f.write(body) }
    else
	puts "going to read file " + local_filename
	 File.open(local_filename, 'r') {|f| body = f.read() }
   end
    @xml = Nokogiri::XML.parse(body)  
	
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

#p "google sheet load finished"
#	p    @google_sheet 
    
  end


  def import
p "going to load"
    # we generate a scaffold 
    loadgdata
#p "going to import"
#    @headerrowkeys.each do |key|   p   @headerrow[key]     end 
    p @google_sheet
    
	if (@google_sheet==nil)
	p "error! sheet is null!"
	return 
	end


    @table.each do |row| 
# hash with better names
	newrow = {}     
 # create a new 
#p "going to import"
#p row
#p "going to eval"
#p @google_sheet.classname + ".new()"
#      @object.update_attributes(row)
# p @object
      @headerrowkeys.each do |key| 
 	name = @headerrow[key]
#        @object.Parse(name,row[key] )
	newrow[name]=row[key]
      end 

    @object = eval(@google_sheet.classname + ".new(newrow)")
#row
#p "object"
#p @object
	@object.save
    end 
#  format.html { render :action => "scaffold" } 
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
