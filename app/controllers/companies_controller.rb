class CompaniesController < ApplicationController
  def index
  	
  	@companies = User.where(type_of_users: '2').all

  	@prev_profession = params[:profession]
  	@prev_city = params[:city]
  	
    @companies = @companies.search(params[:search])
    @companies = @companies.where("profession_id = ?", params[:profession] ) if params[:profession].present?
    @companies = @companies.where("city_id = ?", params[:city] ) if params[:city].present?
 		
		@companies = @companies.paginate(page: params[:page], :per_page => 8)
  	
  end

end
