class Comment < ActiveRecord::Base
	belongs_to :article
	#date_created, body, author, article_id
end
