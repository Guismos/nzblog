class Article < ActiveRecord::Base
  has_attached_file :picture, default_url: "/images/missing.png", :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
	validates_attachment :picture, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

  has_many :comments
	#date_created, latitude, longitude, title, body, picture
end
