class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post = Post.new
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(params[:post])

		if @post.save
			redirect_to posts_path
		else
			render action: "new"
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = Comment.new
	end

	def destroy
		@post = Post.find(params[:id])
		if current_user=(@post.user)
			@post.destroy
			redirect_to posts_path
		else
			redirect_to posts_path
		end
	end

	def favourite
		@post = Post.find(params[:id])
		if favourited?(@post)
			binding.pry
			current_user.favourite_post_ids - [@post.id]
			current_user.save
			@post.favourite_user_ids - [current_user.id]
			@post.save
			redirect_to posts_path
		else
			@post.favourite_users << current_user
			@post.save
			redirect_to posts_path
		end	
	end

	def vote
		@post = Post.find(params[:id])

		# binding.pry
		if voted?(@post)
			redirect_to posts_path
		else
			if params[:vote] == "up"
				@post.voteup_user_ids << current_user.id
			elsif params[:vote] == "down"
				@post.votedown_user_ids << current_user.id
			end
			@post.save
			redirect_to posts_path
		end
	end
end