class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  flash[:alert] = exception.message
  redirect_to root_url
end
end
def create
  @user = User.create( params[:user] )
end