class PointTag < ActiveRecord::Base
  belongs_to :point, :foreign_key => 'point_id'
  validates_length_of :key, :value, :maximum => 512, :allow_blank => true
  validates_uniqueness_of :id, :scope => :key

  def self.from_xml_node(tag_xml)
    point_tag = PointTag.new

    point_tag.key = tag_xml.attributes['k']
    point_tag.value = tag_xml.attributes['v']

    return point_tag
  end

end
