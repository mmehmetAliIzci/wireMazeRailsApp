class Job < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "165x165", :thumb => "80x78" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  belongs_to :user
  belongs_to :profession
  has_many :job_user_relationship
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 200 }


  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end
end
