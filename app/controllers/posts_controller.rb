class PostsController < ApplicationController
  respond_to :js, :html
  def new
    @post = Post.new
  end

  def create
    @posts = Post.create(post_params.merge(user_id: current_user.id))
    user = User.find_by(id: "#{@posts.user_id}")
    session[:username] = user.username
    redirect_to posts_url
  end
    
  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
