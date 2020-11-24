class PostsController < ApplicationController
  respond_to :js, :html
  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(params[:post].permit(:message, :user_id))
    # @post = Post.create(post_params)
    # @post.user_id = current_user.id
    @posts = Post.create(post_params.merge(user_id: current_user.id))
    user = User.find_by(id: @posts.user_id.to_s)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def edit; end

  def destroy
    Post.delete(params[:id])
    # Post.delete(params[:id])
    # @post.delete
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
