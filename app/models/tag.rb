class Tag < ActiveRecord::Base
  has_many :tag_tags, :autosave => true


  accepts_nested_attributes_for :tag_tags

  def to_xml(options = {})
    options[:include] = [ :tag_tags ]
    super
  end

end
