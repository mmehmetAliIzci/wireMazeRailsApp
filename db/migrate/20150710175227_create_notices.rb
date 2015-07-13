class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.datetime :date
      t.string :summary
      t.string :text
      t.boolean :active
      t.boolean :prior

      t.timestamps null: false
    end
  end
end
