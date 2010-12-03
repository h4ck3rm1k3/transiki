class GenGeoTag 
#< ActiveRecord::Base
  require 'pp'

  def logv(name,val)
    p "gengeotag:Name:" + name 

    pp val

  end

  def log(name)
    p "gengeotag:LOG:" + name 

  end



  # the targetclass is the class we want to create
  # targetclassname is the name of the class 
  # this uses the class Point as the geotag

  # four cases 
  # called with no newpoint parameter or empty one, this will create a new point in memory to be filled out.
  # called to save that point
  # called to update the location of the point, so the pointtag was filled out.

  def create_point_geotag (targetclass,  idtoget, newpoint , defaultpoint)

    logv("targetclassname",targetclass.name)
    logv("newpoint",newpoint)
    logv("idtoget",idtoget)

    # the object that will be associated with a point
    targetobject = targetclass.find(idtoget)
    raise "No object found " + targetclass.name + " and " + idtoget unless targetobject
    fieldvalraw  = targetobject.id
    fieldval     = fieldvalraw.to_s

    newgeoobject = nil # the point 

    # lets look up 
    fieldname = targetclass.name + "_id"

    logv("look up point tag for fieldname ",fieldname)
    logv("look up point tag for fieldvalue ",fieldval)

    pt = PointTag.where(:key => fieldname,     :value =>fieldval ).first
    
    if (pt)
      # found 
      logv( "We found an existing tag ", pt)

      point =pt.point()

      if(newpoint )  # we have an object to save
        # we have a post, lets save it.
        point.latitude=newpoint["latitude"]
        point.longitude=newpoint["longitude"]
        point.save        
      else

        log("we have a database point to update, but no data, strange!")
        raise "database inconsitent"

      end

    else
        log("no pointtag found, lets add one")
      if(newpoint )  # did we get a point as a parametre?
        # we have a post, lets save it.
        point=Point.new(newpoint)
        point.save
        logv( "created new point", point)

        pt = PointTag.new
        pt.point_id=point.id
        pt.key = fieldname
        pt.value = fieldval # as a string

        pt.save
        logv( "created new pointtag ", pt)

      else
        # to store the point and to fill it out.
        # this is the new point
        point = Point.new

        point.latitude=     defaultpoint.latitude
        point.longitude=    defaultpoint.longitude

        logv( "created new point", point)
      end

    end

    logv( "going to return  ", point)

    # the point will be returned no matter what
    return point
    
  end




end
