module PostsHelper
	def current_user=(user)
		current_user = user
	end

	def favourited?(post)
		post.favourite_user_ids.include?(current_user.id)
	end

	def voted?(post)
		post.voteup_user_ids.include?(current_user.id) || post.votedown_user_ids.include?(current_user.id)
	end
end