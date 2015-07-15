class AddActivationDigestToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :activation_digest, :string
    change_column :users, :active, :boolean, default: false
    add_column :users, :activated_at, :datetime
  end
end
