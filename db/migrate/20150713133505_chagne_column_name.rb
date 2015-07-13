class ChagneColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :type, :type_of_users
  end
end
