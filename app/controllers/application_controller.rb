class ApplicationController < ActionController::Base
  protect_from_forgery
end
def create
  @user = User.create( params[:user] )
end