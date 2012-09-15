class User
	include Mongoid::Document

	#relation with other models
	has_many :posts
	has_many :comments
	has_many :notifications
	has_and_belongs_to_many :events
	has_and_belongs_to_many :favourite_posts, class_name: "Post", inverse_of: :favourite_users
end