require 'rails_helper'

RSpec.describe 'User Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'Return http success' do
      get '/users/5/posts'
      expect(response.status).to eq(200)
    end

    it 'response renders the correct template' do
      get '/users/5/posts'
      expect(response).to render_template('index')
    end

    it 'response conatins the right placeholder text' do
      get '/users/5/posts'
      expect(response.body).to include('List available posts for UserId: 5')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'Return http success' do
      get '/users/5/posts/2'
      expect(response.status).to eq(200)
    end

    it 'response renders the correct template' do
      get '/users/5/posts/3'
      expect(response).to render_template('show')
    end

    it 'response conatins the right placeholder text' do
      get '/users/2/posts/7'
      expect(response.body).to include('Show post with postId: 7 for userId: 2')
    end
  end
end
