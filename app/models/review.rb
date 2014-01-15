class Review < ActiveRecord::Base
  attr_accessible :content, :title, :profile_name, :image, :user_id, :venue_id
  
  belongs_to :restroom
  belongs_to :venue
  belongs_to :user

  has_attached_file :image, styles: {thumbnail: "50x50", medium: "250x250", small: "125x125", extra_small: "50x50"}

  validates_numericality_of :user_id
  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
end
