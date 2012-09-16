class Post
	include Mongoid::Document
	include Mongoid::Timestamps

	#relation with other models
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category, inverse_of: nil
	has_and_belongs_to_many :favourite_users, class_name: "User", inverse_of: :favourite_posts

	#attributes
	field :content, type: String
	field :voteup_user_ids, type: Array, default: []
	field :votedown_user_ids, type: Array, default: []
end