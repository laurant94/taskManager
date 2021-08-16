# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'laurant1', password: 'aaaaaaaa', 
  email: "gg1@qct.com", password_confirmation: 'aaaaaaaa', role: "admin" )

user = User.find_by_username('laurant1')
20.times do |time|
  Label.create(name: Faker::Book.genre, user: user)
end

20.times do 
  labels = Label.limit(rand(1..5)).offset(rand(0..15))
  task = Task.new(title: Faker::Book.title, 
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4))
  task.labels << labels
  user.tasks << task
end
