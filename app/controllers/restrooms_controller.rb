class RestroomsController < ApplicationController
  # GET /restrooms
  # GET /restrooms.json
  before_filter :authenticate_user!, :except => [:index, :show, :venue_details]
  
  def index
    params[:search].present?
      client = Foursquare2::Client.new(:client_id => '45M1USHSGHPODOQWPSYJGAW50GBCMIHCKVQF410CKBCSO024', :client_secret => '4GO20RGY0BTI3VAQSS04P35AJ4A0DIZWF2JWLRPBFP0SDNQK')
      results = client.search_venues(:ll => '40.365277,-82.669252', :query => params[:search])

      @venues = results.groups[0].items.map { |result| Restroom.from_foursquare(result) }

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
     @venue = client.venue("4bd2fefa9854d13a879efc4d")
    # default venue is the "Tour Eiffel"
    #@venue_id = params[:venue_id] || "185194"
    #@venue = foursquare.venues.find(@venue_id)
  end

  # GET /restrooms/1
  # GET /restrooms/1.json
  def show
    #@restroom = Restroom.find(params[:id])
    @venue = client.venue(:query => params[:venue_id])

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
