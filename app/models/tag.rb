class Tag < ActiveRecord::Base
  has_many :tag_tags, :autosave => true


  accepts_nested_attributes_for :tag_tags

  def to_xml(options = {}) 
    doc = REXML::Document.new
    root = REXML::Element.new 'tw'
    point = REXML::Element.new 'tagtype'
    point.attributes['id'] = self.id
    point.attributes['version'] = self.version
    point.attributes['name'] = self.name
    point.attributes['description'] = self.description
    point.attributes['user'] = self.user_id

    self.tag_tags.each do |t|
      tag = REXML::Element.new 'tag'
      tag.attributes['k'] = t.key
      tag.attributes['v'] = t.value
      tag.attributes['r'] = t.version
      tag.attributes['u'] = t.user_id
      point.elements << tag
    end

    root.elements << point
    doc.elements << root

    return doc
  end

end
