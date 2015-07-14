class CompaniesController < ApplicationController
  def index
  	@users = User.where(type_of_users: '2').all
  end
end
