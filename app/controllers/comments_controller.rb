class CommentsController < ApplicationController
	 before_filter :require_user_signed_in, only: [:create]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user = current_user

		if @comment.save
			respond_to do |format|
			#redirect_to :back, notice: 'Comment was successfully created.'
			format.js
			end
		else
			redirect_to root_path 
		end

    
	
	end
	
	private
    def comment_params
      params.require(:comment).permit(:user_id, :body,:post_id)
    end

end
