class VenuesController < ApplicationController
  # GET /restrooms
  # GET /restrooms.json
  before_filter :authenticate_user!, :except => [:index, :show, :venue_details, :venue_show]
  #before_filter :create_venue, only: [:create, :venue_details]
  
  def index
  	if
    params[:search].present?
      client = Foursquare2::Client.new(:client_id => '45M1USHSGHPODOQWPSYJGAW50GBCMIHCKVQF410CKBCSO024', :client_secret => '4GO20RGY0BTI3VAQSS04P35AJ4A0DIZWF2JWLRPBFP0SDNQK')
     
      #results = client.search_venues(:ll => '40.0462925,-82.91250359', :query => params[:search])
      results = client.search_venues(:near => params[:location], :query => params[:search])
	
      @venues = results.groups[0].items

      @venues.each do |venue|
        Venue.where({
          name: venue.name,
          address: venue.location.address,
          venue_id: venue.id
        }).first_or_create
      end

  else
	client = Foursquare2::Client.new(:client_id => '45M1USHSGHPODOQWPSYJGAW50GBCMIHCKVQF410CKBCSO024', :client_secret => '4GO20RGY0BTI3VAQSS04P35AJ4A0DIZWF2JWLRPBFP0SDNQK')
     
      results = client.search_venues(:ll => '40.0462925,-82.91250359', :query => params[:search])
      @venues = results.groups[0].items
end


    #else
    #  @restrooms = Restroom.all
   # end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restrooms }
    end
  end
  
  def venue_details
     client = Foursquare2::Client.new(:client_id => '45M1USHSGHPODOQWPSYJGAW50GBCMIHCKVQF410CKBCSO024', :client_secret => '4GO20RGY0BTI3VAQSS04P35AJ4A0DIZWF2JWLRPBFP0SDNQK')
     @pics = client.venue_photos(params[:venue_id], options = {:group => 'venue'})
     @venue = client.venue(params[:venue_id])
     

    @review = Review.new
    #@review.venue_id = @venue.id
  end

  # GET /restrooms/1
  # GET /restrooms/1.json
  def venue_show
    #@restroom = Restroom.find(params[:id])
    @venue = Venue.find_by_venue_id(params[:venue_id])
    #@review = Review.new
    #@review.venue_id = @venue.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restroom }
    end
  end

  # GET /restrooms/new
  # GET /restrooms/new.json
  def new
    @restroom = Restroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restroom }
    end
  end

  # GET /restrooms/1/edit
  def edit
    @restroom = Restroom.find(params[:id])
    authorize! :edit, @restroom
  end

  # POST /restrooms
  # POST /restrooms.json
  def create
    #authorize! :create, @restroom
    @restroom = Restroom.new(params[:restroom])
    @restroom.user_id=current_user.id 
    
    respond_to do |format|
      if @restroom.save
        format.html { redirect_to @restroom, notice: 'Restroom was successfully created.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: "new" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restrooms/1
  # PUT /restrooms/1.json
  def update
    @restroom = Restroom.find(params[:id])
    authorize! :update, @restroom

    respond_to do |format|
      if @restroom.update_attributes(params[:restroom])
        format.html { redirect_to @restroom, notice: 'Restroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restrooms/1
  # DELETE /restrooms/1.json
  def destroy
    @restroom = Restroom.find(params[:id])
    @restroom.destroy
    authorize! :destroy, @restroom

    respond_to do |format|
      format.html { redirect_to restrooms_url }
      format.json { head :no_content }
    end
  end

end
