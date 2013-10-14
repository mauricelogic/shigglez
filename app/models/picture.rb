class Picture < ActiveRecord::Base
attr_accessible :caption, :description, :profile_name, :user_id

  belongs_to :restroom
  belongs_to :user
  
  validates_numericality_of :user_id
end
