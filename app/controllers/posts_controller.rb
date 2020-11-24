class PostsController < ApplicationController
  respond_to :js, :html
  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(post_params)
    @posts = Post.create(post_params.merge(user_id: current_user.id))
    user = User.find_by(id: "#{@posts.user_id}")
    redirect_to posts_url
  end
    
  def index
    @posts = Post.all
  end

  def destroy
    @post = User.find_by(params[:post_id])
    Post.delete(params[:id])
    # @post.delete
    redirect_to posts_url
  end

  # private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
