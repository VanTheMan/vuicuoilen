class Comment
	include Mongoid::Document
	
	#relation
	belongs_to :user
	belongs_to :post
end