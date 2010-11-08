class SimpleSchedulesController < ApplicationController
  # GET /simple_schedules
  # GET /simple_schedules.xml
  def index
    @simple_schedules = SimpleSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simple_schedules }
    end
  end

  # GET /simple_schedules/1
  # GET /simple_schedules/1.xml
  def show
    @simple_schedule = SimpleSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simple_schedule }
    end
  end

  # GET /simple_schedules/new
  # GET /simple_schedules/new.xml
  def new
    @simple_schedule = SimpleSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simple_schedule }
    end
  end

  # GET /simple_schedules/1/edit
  def edit
    @simple_schedule = SimpleSchedule.find(params[:id])
  end

  # POST /simple_schedules
  # POST /simple_schedules.xml
  def create
    @simple_schedule = SimpleSchedule.new(params[:simple_schedule])

    respond_to do |format|
      if @simple_schedule.save
        format.html { redirect_to(@simple_schedule, :notice => 'Simple schedule was successfully created.') }
        format.xml  { render :xml => @simple_schedule, :status => :created, :location => @simple_schedule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simple_schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simple_schedules/1
  # PUT /simple_schedules/1.xml
  def update
    @simple_schedule = SimpleSchedule.find(params[:id])

    respond_to do |format|
      if @simple_schedule.update_attributes(params[:simple_schedule])
        format.html { redirect_to(@simple_schedule, :notice => 'Simple schedule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simple_schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_schedules/1
  # DELETE /simple_schedules/1.xml
  def destroy
    @simple_schedule = SimpleSchedule.find(params[:id])
    @simple_schedule.destroy

    respond_to do |format|
      format.html { redirect_to(simple_schedules_url) }
      format.xml  { head :ok }
    end
  end
end
