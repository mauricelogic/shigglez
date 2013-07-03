class Restroom < ActiveRecord::Base
  attr_accessible :business_name, :category, :city, :description, :phone_number, :state, :street_address, :zip_code, :image
  
  validates :description, presence: true
  validates :street_address, presence: true
  
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  has_many :reviews, :dependent => :destroy
  has_attached_file :image, styles: {thumbnail: "115x115", medium: "250x250", small: "150x150"}

  letsrate_rateable

  geocoded_by :address

  def address
  [street_address, city, state].compact.join(', ')
end 

  after_validation :geocode 
end
