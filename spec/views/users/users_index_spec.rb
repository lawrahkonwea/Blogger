require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.describe 'User', type: :feature, js: false do
  users = User.all

  before(:each) do
    visit "#{base_url}/users"
  end

  describe 'content of user index page' do
    it 'shows the username' do
      users.each { |user| expect(page).to have_content user.name }
    end

    it 'should show users photo' do
      users.each { |user| expect(page).to have_css("img[src='#{user.photo}']") }
    end

    it 'should display number of posts' do
      users.each { |user| expect(page).to have_content("Number of posts: #{user.posts.count}") }
    end

    it 'redirect to user show page when username is clicked' do
      User.all.each.with_index do |_user, index|
        username = page.all('.button_link')[index]
        user_show_path = "#{base_url}/users/#{User.find_by(name: username.find('.username_btn').text).id}"
        username.click
        expect(page).to have_current_path(user_show_path)
        visit "#{base_url}/users"
      end
    end
  end
end
