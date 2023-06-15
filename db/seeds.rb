# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Amaka', photo: 'https://avatars.githubusercontent.com/u/105006208?v=4', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Ifeanyi', photo: 'https://avatars.githubusercontent.com/u/105528809?v=4', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Mildred', photo: 'https://avatars.githubusercontent.com/u/78565848?v=4', bio: 'Teacher from Hungary.')

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'ONE This is my first post')
second_post = Post.create(author_id: first_user.id, title: 'Hi there', text: 'ONE This is my second post')
third_post = Post.create(author_id: first_user.id, title: 'Holaaa', text: 'ONE This is my third post')
fourth_post = Post.create(author_id: second_user.id, title: 'Hello', text: 'TWO This is my first post')
fifth_post = Post.create(author_id: second_user.id, title: 'Hey hey', text: 'TWO This is my second post')
sixth_post = Post.create(author_id: second_user.id, title: 'Testing', text: 'TWO This is my third post')
seventh_post = Post.create(author_id: third_user.id, title: 'Checking', text: 'THREE This is my first post')
eight_post = Post.create(author_id: third_user.id, title: 'Another day to slay', text: 'THREE This is my second post')
nineth_post = Post.create(author_id: third_user.id, title: 'favorites', text: 'THREE This is my third post')