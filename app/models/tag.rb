class Tag < ActiveRecord::Base
  has_many :tag_tags
end
