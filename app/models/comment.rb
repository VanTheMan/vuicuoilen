class Comment
	include Mongoid::Document
	include Mongoid::Timestamps
	
	#relation
	belongs_to :user
	belongs_to :post

	#attributes
	field :content, type: String
end