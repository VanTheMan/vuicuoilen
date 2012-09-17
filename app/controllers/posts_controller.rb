class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]

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
		@post.favourite_user(current_user)
		redirect_to posts_path
	end

	def unfavourite
		@post = Post.find(params[:id])
		current_user.unfavourite_post(@post)
		@post.unfavourite_user(current_user)
		redirect_to posts_path
	end

	def vote
		@post = Post.find(params[:id])

		if voted?(@post)
			redirect_to posts_path
		else
			if params[:vote] == "up"
				@post.vote_up(current_user)
			elsif params[:vote] == "down"
				@post.vote_down(current_user)
			end
			redirect_to posts_path
		end
	end
end