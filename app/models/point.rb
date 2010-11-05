class Point < ActiveRecord::Base 
  has_many :point_tags

  def tag_string=(ts)
    point_tags = []

    ts.split(',').each do |keyval|
      #puts "Look at " + keyval
      if keyval.include? '=' # throw it away if no equals

        keyvalarray = keyval.chomp.split('=')
        key = keyvalarray[0]
        val = keyvalarray[1]
       # puts "Look at " 
       # puts key
       # puts val

        pt = PointTag.new
        pt.key = key.strip
        pt.value = val.strip
        point_tags  += [pt]
        #p point_tags
      else
        #puts "Bad" + keyval
      end
    end

    @tags = point_tags
  end

  def tag_string
    if self.id
      tags = PointTag.find(:all, :conditions => "point_id = #{self.id}")
      ts = ''
      first = true
      tags.each do |pt|
        ts += "," unless first
        ts += pt.key + "=" + pt.value
        first = false
      end

      return ts
    else
      return ""
    end
  end

  def validate_tag_string
    #maybe FIXME?
    puts "FIXME validate_tag_string"
  end


  def save_with_history!
    Point.transaction do
      self.version = 0 unless self.version
      self.version += 1
      
      puts "going to save"
      p self
      self.save!
      p self
      point = Point.from_point(self)

      puts "Create new point"
      p point


      @tags.each do |tag|
        ntag = PointTag.new
        ntag.key=tag.key
        ntag.value=tag.value
        ntag.version = 1
        ntag.point_id = self.id # FIXME I think this isn't needed
        puts "before save"
        p ntag

        point.point_tags  += [ntag]
        p point.point_tags
        ntag.save!
        puts "after save"
        p tag
        p ntag
        p point.point_tags
        
      end

      p point
      p self


    end

  end

  def delete_with_history!(user)
    Point.transaction do
      self.visible = false
      self.version += 1
      self.user_id = user.id
      
      point_tags.each do |pt|
        pt.destroy
      end

      self.save!

      p = Point.find(self.id)

      point = Point.from_point(p)

#      point.save_with_dependencies!
    end
  end

  def self.from_point(pt)

    point = Point.new

    point.id = pt.id
    point.latitude = pt.latitude
    point.longitude = pt.longitude
    point.version = pt.version
    point.user_id = pt.user_id
    point.visible = pt.visible

    pt.point_tags.each() do |tag|
      pt = PointTag.new
      pt.key = tag.key
      pt.value = tag.value
      pt.version = tag.version
      pt.point_id = pt.point_id
      p point
      p point.point_tags
      p pt
      point.point_tags << pt
    end

    return point
    
  end

  def self.from_xml(xml, create=false)
    doc = REXML::Document.new(xml)

    doc.elements.each('//tw/point') do |pt|
      return Point.from_xml_point(pt,create)
    end
  end

  def self.from_xml_point(pt, create=false)
    point = Point.new

    point.latitude = pt.attributes['lat']
    point.longitude = pt.attributes['lon']
    point.visible = true

    pt.elements.each('tag') do |tag|
      pt = PointTag.new
      pt.key = tag.attributes['k']
      pt.value = tag.attributes['v']
      point.point_tags << pt
    end

    return point
  end

  def to_xml
    doc = REXML::Document.new
    root = REXML::Element.new 'tw'
    point = REXML::Element.new 'point'
    point.attributes['id'] = self.id
    point.attributes['version'] = self.version
    point.attributes['lat'] = self.latitude
    point.attributes['lon'] = self.longitude

    self.point_tags.each do |t|
      tag = REXML::Element.new 'tag'
      tag.attributes['k'] = t.key
      tag.attributes['v'] = t.value
      point.elements << tag
    end

    root.elements << point
    doc.elements << root

    return doc
  end

end
