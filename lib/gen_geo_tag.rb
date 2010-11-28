class GenGeoTag 
#< ActiveRecord::Base

  def logv(name,val)
    p "Name:" + name 
    pp val
  end



  # the targetclass is the class we want to create
  # targetclassname is the name of the class 
  # this uses the class Point as the geotag

  # four cases 
  # called with no newpoint parameter or empty one, this will create a new point in memory to be filled out.
  # called to save that point
  # called to update the location of the point, so the pointtag was filled out.

  def create_point_geotag (targetclass,  idtoget, newpoint )

    logv("targetclassname",targetclass.name)
    logv("newpoint",newpoint)
    logv("idtoget",idtoget)

    # the object that will be associated with a point
    targetobject = targetclass.find(idtoget)
    raise "No object found " + targetclass.name + " and " + idtoget unless targetobject
    fieldvalraw  = targetobject.object_id
    fieldval     = fieldvalraw.to_s

    newgeoobject = nil # the point 

    # lets look up 
    fieldname = targetclass.name + "_id"

    pt = PointTag.where(:key => fieldname,     :value =>fieldval ).first
    
    if (pt)
      # found 
      logv( "We found an exiting tag ", pt)

      point =pt.point()

      if(newpoint )  # we have an object to save
        # we have a post, lets save it.
        point.latitude=newpoint["latitude"]
        point.longitude=newpoint["longitude"]
        point.save        
      else

        ## we have a database point to update, but no data, strange!

      end

    else
      # no pointtag found, lets add one
      if(newpoint )  # did we get a point as a parametre?
        # we have a post, lets save it.
        point=Point.new(newpoint)
        point.save
        pt = PointTag.new
        pt.point_id=point.id
        pt.key = fieldname
        pt.value = fieldval # as a string
        pt.save
      else
        # to store the point and to fill it out.
        # this is the new point
        point = Point.new
        point.latitude=0
        point.longitude=0
      end

    end

    # the point will be returned no matter what
    return point
    
  end




end
