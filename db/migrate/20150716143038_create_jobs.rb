class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.date :valid_from
      t.date :valid_to
      t.references :company, index: true, foreign_key: true
      t.string :salary
      t.string :type_of_contract
      t.references :profession, index: true, foreign_key: true
      t.boolean :active

      t.timestamps null: false
    end
  end
end
