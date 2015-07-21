class AddIsWorkingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isworking, :boolean
  end
end
