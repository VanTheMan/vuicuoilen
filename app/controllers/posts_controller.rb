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
		
	end
end