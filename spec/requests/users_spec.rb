require 'rails_helper'

base_url = 'http://localhost:3000'

first_user = User.first
last_user = User.last

random = rand(first_user.id..last_user.id)

RSpec.describe 'Users', type: :request do

  context 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      get '/users'
      expect(response.body).to include('<h1 class="heading">RailsBlog</h1>')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/1'
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      get '/users/1'
      expect(response.body).to include('<h2>Bio</h2>')
    end
  end
end
