require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'Return http success' do
      get '/users'
      expect(response.status).to eq(200)
    end

    it 'response renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'response conatins the right placeholder text' do
      get '/users'
      expect(response.body).to include('List available users')
    end
  end

  describe 'GET /users/:id' do
    it 'Return http success' do
      get '/users/2'
      expect(response.status).to eq(200)
    end

    it 'response renders the correct template' do
      get '/users/2'
      expect(response).to render_template('show')
    end

    it 'response conatins the right placeholder text' do
      get '/users/2'
      expect(response.body).to include('User with Id:2')
    end
  end
end
