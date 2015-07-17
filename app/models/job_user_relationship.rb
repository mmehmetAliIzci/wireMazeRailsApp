class JobUserRelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :job
	validates :job_id, presence: true
  	validates :user_id, presence: true
end
