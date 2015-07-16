class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :profession
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 200 }

end
