module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do

      desc "Creates a new post"
        params do 
          requires :message, type: String, desc: "message of the post"
          requires :user_id, type: String, desc: "Username of current user"
        end 
        post "message" do
          Post.create!({ message:permitted_params[:message], user_id: permitted_params[:user_id]})
        end 

      desc "Return all posts"
        get "" do
          Post.all
        end

      desc "Return a post"
        params do
          requires :id, type: String, desc: "ID of the post"
        end
        get ":id" do
          Post.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end