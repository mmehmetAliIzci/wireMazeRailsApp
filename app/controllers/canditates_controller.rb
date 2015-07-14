class CanditatesController < ApplicationController
  def index
  	@users = User.where(type_of_users: '1').all
  end
end
