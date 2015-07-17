class CreateJobUserRelationships < ActiveRecord::Migration
  def change
    create_table :job_user_relationships do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :job_user_relationships, :user_id
    add_index :job_user_relationships, :job_id
    add_index :job_user_relationships, [:user_id, :job_id], unique: true
  end
end
