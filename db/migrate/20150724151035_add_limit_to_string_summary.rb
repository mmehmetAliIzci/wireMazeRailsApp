class AddLimitToStringSummary < ActiveRecord::Migration
  def change
  	change_column :users, :presentation, :string, limit: 100
  end
end
