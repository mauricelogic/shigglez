class Album < ActiveRecord::Base
  belongs_to :restroom
  has_many :pictures
  attr_accessible :title
end
