class TagTagsController < ApplicationController
  # GET /tag_tags
  # GET /tag_tags.xml
  def index
    @tag_tags = TagTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag_tags }
    end
  end

  # GET /tag_tags/1
  # GET /tag_tags/1.xml
  def show
    @tag_tag = TagTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag_tag }
    end
  end

  # GET /tag_tags/new
  # GET /tag_tags/new.xml
  def new
    @tag_tag = TagTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_tag }
    end
  end

  # GET /tag_tags/1/edit
  def edit
    @tag_tag = TagTag.find(params[:id])
  end

  # POST /tag_tags
  # POST /tag_tags.xml
  def create
    @tag_tag = TagTag.new(params[:tag_tag])

    respond_to do |format|
      if @tag_tag.save
        format.html { redirect_to(@tag_tag, :notice => 'Tag tag was successfully created.') }
        format.xml  { render :xml => @tag_tag, :status => :created, :location => @tag_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_tags/1
  # PUT /tag_tags/1.xml
  def update
    @tag_tag = TagTag.find(params[:id])

    respond_to do |format|
      if @tag_tag.update_attributes(params[:tag_tag])
        format.html { redirect_to(@tag_tag, :notice => 'Tag tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_tags/1
  # DELETE /tag_tags/1.xml
  def destroy
    @tag_tag = TagTag.find(params[:id])
    @tag_tag.destroy

    respond_to do |format|
      format.html { redirect_to(tag_tags_url) }
      format.xml  { head :ok }
    end
  end
end
