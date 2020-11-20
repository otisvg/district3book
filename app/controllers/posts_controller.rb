class PostsController < ApplicationController
  respond_to :js, :html
  def new
    @post = Post.new
  end

  def create
    @posts = Post.create(post_params.merge(user_id: current_user.id))
    username = User.find_by(id: "#{@posts.user_id}")
    p "this is the username: #{username.username}"
    # @post = Post.create(post_params.merge(user_id: current_user.id))
    # p post_params
    # p @post
    # # @post = Post.create(post_params)
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
