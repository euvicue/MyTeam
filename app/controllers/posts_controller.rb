class PostsController < ApplicationController
	    before_filter :authenticate_user!
	def new
		@post = Post.new
		@leagues = League.all
	end
	 def create
   		@post = Post.new(post_params)
   		@post.user = current_user
   	   	@post.save
 	 end

 private
    def set_post
      @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:title,:body,:league_id)
  end
end
