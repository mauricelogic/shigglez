class Venue < ActiveRecord::Base
  attr_accessible :address, :name

  has_many :reviews

  letsrate_rateable

  def self.fetch_name(name)
  	if result = find_by_name(name) 
  		result
  	else
  		result = self.client.search_venues(:name => name)
  		self.create(:address => result.location.address, :name => result.name)
	end
	end

private

	def self.client
	Foursquare2::Client.new(:client_id => '45M1USHSGHPODOQWPSYJGAW50GBCMIHCKVQF410CKBCSO024', :client_secret => '4GO20RGY0BTI3VAQSS04P35AJ4A0DIZWF2JWLRPBFP0SDNQK')	
	end

  def create_venue
    #logic goes here
    
  end

end
