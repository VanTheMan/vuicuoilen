class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.build(params[:comment])
		@comment.post = Post.find(params[:post_id])

		if @comment.save
			redirect_to root_path
		else
			render action: "new"
		end
	end
end