class RoutesController < ApplicationController
  before_filter :require_user_api, :only => [:create_xml]

  def index
    @routes = Route.all
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
    redirect_to(@route, :notice => "Route #{@route.id} was successfully updated.")     

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
