class RouteTag < ActiveRecord::Base
  def self.from_xml_node(tag_xml)
    route_tag = RoutePointTag.new

    route_tag.key = tag_xml.attributes['k']
    route_tag.value = tag_xml.attributes['v']

    return route_tag
  end

end
