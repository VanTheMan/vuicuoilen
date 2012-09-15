class Post
	include Mongoid::Document

	#relation with other models
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category, inverse_of: nil
	has_and_belongs_to_many :favourite_users, class_name: "User", inverse_of: :favourite_posts
	#attributes

end