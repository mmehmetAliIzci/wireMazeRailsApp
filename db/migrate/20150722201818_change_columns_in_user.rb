class ChangeColumnsInUser < ActiveRecord::Migration
  def change
  	change_column :users, :post_code, :string
  	change_column :users, :contact, :string
  end
end
