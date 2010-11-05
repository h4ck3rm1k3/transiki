class RoutesController < ApplicationController
  before_filter :require_user, :only => [:new, :edit]
  before_filter :require_user_api, :only => [:create_xml]

  def index
    @routes = Route.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end

  end

  def show
    @route = Route.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route }
    end
  end

  def create
    @route = Route.new
    @route.save
    redirect_to(@route, :notice => "Route #{@route.id} was successfully created.")     
  end

  def new
    @route = Route.new
    @route.save
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route }
    end
    
  end

  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        p "DEBUG update OK"
        redirect_to(@route, :notice => "Route #{@route.id} was successfully updated.")     
        format.xml  { head :ok }
      else
        p "DEBUG update fail"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
      end
    end

  end

  def edit
    @route = Route.find(params[:id])
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to(routes_url)
  end

  def create_xml
    route = Route.from_xml(request.raw_post.to_s, true)
    route.user_id = @user.id

    route.save_with_history!

    render :text => route.id, :content_type => 'text/plain'
  end

end
