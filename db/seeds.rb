# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(name: "Mugunthan", email: "mugunthan@email.com", password: "mugunthan", password_confirmation: "mugunthan", admin: true)
User.create!(name: "Avenger", email: "avenger@email.com", password: "avenger", password_confirmation: "avenger", admin: true)

# Generate a bunch of additional users. 
99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@email.com"
    password = "password"
    password_confirmation = "password"
    User.create!(name:  name, email: email, password: password, password_confirmation: password_confirmation)
end

# Generate microposts for a subset of users. 
users = User.order(:created_at).take(6) 
50.times do
    content = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }