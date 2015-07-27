class StaticPagesController < ApplicationController
  def home
         
  	@jobs_home= Job.find_by_sql("SELECT * FROM jobs WHERE active = true ORDER BY id DESC LIMIT 3")
  	@notices_home = Notice.find_by_sql("SELECT * FROM notices ORDER BY id DESC LIMIT 3")
  	@companies_home = User.find_by_sql("SELECT * FROM users WHERE users.type_of_users = 2 ORDER BY id DESC LIMIT 3")
  	@canditates_home = User.find_by_sql("SELECT * FROM users WHERE users.type_of_users = 1 ORDER BY id DESC LIMIT 3")
  end

end
