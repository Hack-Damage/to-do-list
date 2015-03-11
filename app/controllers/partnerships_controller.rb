class PartnershipsController < ApplicationController

def create
	user  = current_user
    user.partnerships << Partnership.new(friender_id => params[:friender_id])
  if user.save
  	flash[:notice] = "added partnership"
  	redirect_to root_url
  end
end

def destroy
  @partnership = current_user.partnerships.find(params[:id])
  @partnership.destroy
  flash[:notice] = "Removed partnership."
  redirect_to current_user
end



end
