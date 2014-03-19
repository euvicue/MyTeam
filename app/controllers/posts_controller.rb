class PostsController < ApplicationController
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
    def set_league
      @post = Post.find(params[:id])
    end

  def league_params
    params.require(:post).permit(:title,:text)
  end
end
