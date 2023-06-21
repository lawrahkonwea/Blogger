require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    before(:example) { get('/users/7/posts') }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('<h1>Amaka</h1>')
    end
  end

  context 'GET /show' do
    before(:example) { get('/users/7/posts/26') }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('<span> Ifeanyi : Advantageous</span>')
    end
  end
end
