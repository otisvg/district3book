class PostsController < ApplicationController
  respond_to :js, :html
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params['message'], user_id: current_user.id)
    # @post = Post.create(params[:post].permit(:message, :user_id))
    # @post = Post.create(post_params)
    # @post.user_id = current_user.id
    # @posts = Post.create(post_params.merge(user_id: current_user.id))
    # user = User.find_by(id: @posts.user_id.to_s)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:message))
        redirect_to posts_url
        flash[:notice] = 'post was updated.'
    else
        render 'edit'
    end
end    

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
