# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Steve Jobs", email: "stevie@gmail.com", password:"123456")

User.create(name: "Test User 1", email: "test@email.com", password:"123456")
User.create(name: "Test User 2", email: "test2@email.com", password:"123456")
User.create(name: "Test User 3", email: "test3@email.com", password:"123456")
User.create(name: "Test User 4", email: "test4@email.com", password:"123456")