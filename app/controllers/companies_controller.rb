class CompaniesController < ApplicationController
  

  def index
  	@professions = Profession.all
  	@cities = City.all
  	@companies = User.where(type_of_users: '2').all

  	@prev_profession = params[:profession]
  	@prev_city = params[:city]
  	
    
    @companies = @companies.where("profession_id = ?", params[:profession] ) if params[:profession].present?
    @companies = @companies.where("city_id = ?", params[:city] ) if params[:city].present?
 		
		   	
  	
  end

end
