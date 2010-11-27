class GenGeoTag 
#< ActiveRecord::Base

  def logv(name,val)
    p "Name:" + name 
    pp val
  end

  # the targetclass is the class we want to create
  # targetclassname is the name of the class 
  # this uses the class Point as the geotag
  def create_point_geotag (targetclass, targetclassname, idtoget, newpoint )

    logv("targetclassname",targetclassname)
    logv("newpoint",newpoint)

    targetobject = targetclassname.find(idtoget)
    newgeoobject = nil # the point 

    # lets look up 
    fieldname = targetclassname + "_id"
    fieldval  = targetobject.object_id.to_s

    pt = PointTag.where(:key => fieldname,     :value =>fieldval ).first

    if (pt)
      # found 
      point =pt.point()

      if(newpoint ) 
        # we have a post, lets save it.
        point.latitude=newpoint["latitude"]
        point.longitude=newpoint["longitude"]
        point.save
      end

      return point
    else
      # no point fount
    end
    
  end

end
