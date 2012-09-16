class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post = Post.new
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
		
	end

	def update
		
	end

	def edit
		
	end

	def destroy
		
	end
end