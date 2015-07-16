class DeleteColumnUserIdFromJobs < ActiveRecord::Migration
  def change
  	remove_column :jobs, :user_id
  end
end
