require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

first_user = User.first
last_user = User.last

random = rand(first_user.id..last_user.id)

RSpec.describe 'index_show', type: :feature, js: false do
  before(:each) do
    @user = User.find(random)
    visit "#{base_url}/users/#{random}"
  end

  describe 'show page' do
    it 'shows the profile photo of user' do
      expect(page.find('img')['src']).to eq @user.photo
    end

    it 'shows the users username' do
      expect(page.find('.username_show').text).to eq @user.name
    end

    it 'displays the number of post for a user' do
      expect(page.find('.userpost_count').text.scan(/\d+/).first.to_i).to eq @user.posts.count
    end

    it 'displays bio for a user' do
      expect(page.find('.user_bio').text).to eq @user.bio.to_s
    end

    it 'shows a users first three posts' do
      user = User.first
      visit "#{base_url}/users/#{user.id}"
      posts = user.posts.limit(3)
      posts.each { |post| expect(page).to have_content(post.title) }
    end

    it "redirects me to the post's show page when I click a user's post" do
      user = User.find_by(name: 'Amaka')
      post = user.posts.find_by(title: 'Hello')
      visit user_path(user)
      click_on 'Hello'
      expect(page).to have_current_path(user_post_path(user, post))
    end

    it 'should have a button to see all posts' do
      button = page.find('.button')
      expect(button.text).to eq 'See all posts'
      expect(button['href']).to eq "#{random}/posts/"
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_on 'See all posts'
      expect(page).to have_current_path("#{base_url}/users/#{random}/posts/")
    end
  end
end
