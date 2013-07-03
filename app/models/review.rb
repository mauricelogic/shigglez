class Review < ActiveRecord::Base
  attr_accessible :content, :title, :profile_name
  
  belongs_to :restroom
  belongs_to :user

  has_attached_file :image, styles: {thumbnail: "75x75", medium: "250x250", small: "150x150"}

  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
end
