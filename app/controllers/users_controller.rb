class UsersController < ApplicationController
  def show
  	@user = User.find(params[:user_id])
  	@reviews = @user.reviews
  end
end


