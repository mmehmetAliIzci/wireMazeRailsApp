class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :address
      t.integer :post_code
      t.integer :contact
      t.string :personal_page
      t.date :birthday
      t.string :id_number
      t.string :presentation
      t.string :habits
      t.string :experience
      t.integer :type
      t.boolean :active

      t.timestamps null: false
    end
  end
end
