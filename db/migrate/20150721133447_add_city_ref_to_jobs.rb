class AddCityRefToJobs < ActiveRecord::Migration
  def change
  	add_reference :jobs, :city, index: true, foreign_key: true
  end
end
