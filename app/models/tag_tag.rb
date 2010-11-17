class TagTag < ActiveRecord::Base
  belongs_to :tag, :foreign_key => 'tag_id'
  validates_length_of :key, :value, :maximum => 512, :allow_blank => true
  validates_uniqueness_of :id, :scope => :key

  def self.from_xml_node(tag_xml)
    tagtag = TagTag.new

    tagtag.key = tag_xml.attributes['k']
    tagtag.value = tag_xml.attributes['v']

    return tagtag
  end

end
