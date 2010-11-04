class PointTag < ActiveRecord::Base

  def self.from_xml_node(tag_xml)
    point_tag = PointTag.new

    point_tag.key = tag_xml.attributes['k']
    point_tag.value = tag_xml.attributes['v']

    return point_tag
  end

end
