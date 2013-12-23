class Restroom < ActiveRecord::Base
  attr_accessible :business_name, :category, :city, :description, :phone_number, :state, :street_address, :zip_code, :image, :user_id, :restroom_id
  
  validates_numericality_of :user_id
  validates :description, presence: true
  validates :street_address, presence: true
  
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  has_many :reviews, :dependent => :destroy
  has_many :pictures, :dependent => :destroy
  has_attached_file :image, styles: {thumbnail: "75x75", medium: "250x250", small: "100x100"}
  belongs_to :user

  letsrate_rateable

  geocoded_by :address

  def self.from_foursquare(result)
    # TODO: we already have a restroom record for this location

    Restroom.new :business_name => result.name, :street_address => result.location.address,
     :city => result.location.city, :state => result.location.state, :zip_code => result.location.postalCode, :phone_number => result.contact.formattedPhone,
     :restroom_id => result.location.city
  end

  def address
      [street_address, city, state].compact.join(', ')
  end 

  after_validation :geocode 
end
