class Notice < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "165x165", :thumb => "80x80" }, :default_url => "/images/normal/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
