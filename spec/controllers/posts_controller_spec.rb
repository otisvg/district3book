require 'rails_helper'
require_relative '../../spec/web_helper/web_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    User.create({ username: 'Harry', email: 'hpotter@pottermail.com', password: '123456' })
    @test_user = User.find_by(email: 'hpotter@pottermail.com').id
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      Post.create({ message: 'Hello, world!' })
      expect(response).to have_http_status(200)
    end
    
    # it 'redirects to home page after post is created' do
    #   User.create(id: 1, username: 'meryl', password: 'password', email: 'example@example.com' )
    #   post :create, params: { post: { message: "Hello, world!", user_id:1} }
    #   expect(response).to redirect_to(posts_url)
    # end


    it 'creates a post' do
      User.create(id: 1, username: 'meryl', password: 'password', email: 'example@example.com' )
      Post.create(id: 1, message: "hello!", user_id: 1)
      expect(Post.find(1).message).to eq 'hello!'
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    describe 'DELETE /' do
      it 'redirects to the home page' do
        User.create(id: 1, username: 'meryl', password: 'password', email: 'example@example.com' )
        Post.create(id: 1, message: "hello!", user_id: 1)
        delete :destroy, params: { id: 1 }
        expect(response).to redirect_to(posts_url)
      end
    end
  end
end
