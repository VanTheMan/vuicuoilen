class User
	include Mongoid::Document

	#relation with other models
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	has_many :owned_events, class_name: "Event", inverse_of: :owner
	has_and_belongs_to_many :joined_events, class_name: "Event", inverse_of: :members
	has_and_belongs_to_many :favourite_posts, class_name: "Post", inverse_of: :favourite_users
	has_and_belongs_to_many :friends, class_name: "User", inverse_of: :friend_ofs
	has_and_belongs_to_many :friend_ofs, class_name: "User", inverse_of: :friends
end