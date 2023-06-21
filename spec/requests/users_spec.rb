require 'rails_helper'

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
    before(:example) { get('/users/7') }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('<h2>Bio</h2>')
    end
  end
end
