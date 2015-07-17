class CanditatesController < ApplicationController
  def index
  	
  	@canditates = User.where(type_of_users: '1').all

  	@prev_profession = params[:profession]
  	@prev_city = params[:city]
  	
    @canditates = @canditates.search(params[:search])
    @canditates = @canditates.where("profession_id = ?", params[:profession] ) if params[:profession].present?
    @canditates = @canditates.where("city_id = ?", params[:city] ) if params[:city].present?
 		
  end
end
