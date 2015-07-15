class CompaniesController < ApplicationController
  def index
  	
  	if params[:search]
    	@companies = User.search(params[:search]).where(type_of_users: '2').order("created_at DESC")
 	else
		@companies = User.where(type_of_users: '2').all    	
  	end
  end
end
