class Notice < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "290x150", :thumb => "290x150", :large => "290x150" }, :default_url => "/images/normal/missing_290150.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


	def self.search(search)
	    if search
	      where("title ILIKE ?", "%#{search}%")
	    else
	      all
	    end
  	end
end
