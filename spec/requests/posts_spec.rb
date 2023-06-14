require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
  end

    