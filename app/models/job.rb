class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :profession
  has_many :job_user_relationship
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 200 }

end
