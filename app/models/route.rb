class Route < ActiveRecord::Base
  has_many :route_points
  has_many :route_tags

  def tag_string=(ts)
    route_tags = []

    ts.split(',').each do |keyval|
      #puts "Look at " + keyval
      if keyval.include? '=' # throw it away if no equals

        keyvalarray = keyval.chomp.split('=')
        key = keyvalarray[0]
        val = keyvalarray[1]
       # puts "Look at " 
       # puts key
       # puts val

        pt = RouteTag.new
        pt.key = key.strip
        pt.value = val.strip
        route_tags  += [pt]
        #p route_tags
      else
        #puts "Bad" + keyval
      end
    end

    @tags = route_tags
  end

  def tag_string
    if self.id
      tags = RouteTag.find(:all, :conditions => "route_id = #{self.id}")
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

  def self.from_xml(xml, create=false)
    doc = REXML::Document.new(xml)

    doc.elements.each('//tw/route') do |route_xml|
      return Route.from_xml_route(route_xml,create)
    end
  end

  def self.from_xml_route(route_xml, create=false)
    route = Route.new


    route.visible = true # FIXME the db should default to true for all these

    route_xml.elements.each('points/pt') do |pt|
      rp = RoutePoint.from_xml_node(pt)
      route.route_points << rp
    end

    route_xml.elements.each('tags/tag') do |tag|
      rt = RouteTag.from_xml_node(tag)
      route.route_tags << rt
    end

    return route
  end

  def save_with_history!
    p self
    self.save!
    p self
    # FIXME save the history too
  end

end
