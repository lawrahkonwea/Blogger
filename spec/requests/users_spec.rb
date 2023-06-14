require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
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
      expect(response.body).to include('')
    end
  end

 
end
