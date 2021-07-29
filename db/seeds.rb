# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Steve Jobs", email: "stevie@gmail.com" )

Project.create(title: "Mac", goal: "Computer that puts Bill Gates out of business and is much easier to use than a Windows PC")

ProjectFeature.create(name: "Messages", description: "App integrated into OS where users can read and send messages from their mac without needing to use their phone.", user_id: 1, project_id: 1 )

