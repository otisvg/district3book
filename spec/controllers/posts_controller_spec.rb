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
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      p Post.inspect

      Post.create({ message: 'Hello, world!' })
      # post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.count).to eq 1
      p Post.first.inspect
      #expect(Post.find_by(message: 'Hello, world!')).to be 
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    describe 'DELETE /' do
      it 'redirects to the home page' do
        post :create, params: { post: { message: 'Hello, world!'} } 
        delete :destroy, params: { id: 1 }
        expect(response).to redirect_to(posts_url)
      end
    end
  end
end
