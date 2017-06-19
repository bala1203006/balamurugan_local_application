# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#to create normal user

User.create(name: "manik", email: "manik@gmail.com", password: "manik", father_name: "natarajan", mother_name: "selvarani", profession: "software engineer", city: "bangalore", state: "karnataka", country: "singapoor", role: "", phone_no: "9842059138")

# to create ADMIN user

User.create (name: "balamurugan", email: "bala@gmail.com", password: "balamurugan", father_name: "natarajan", mother_name: "selvarani", profession: "software engineer", city: "bangalore", state: "karnataka", country: "india", role: "ADMIN",phone_no: "9842059138")

# To create an event

Event.create(name: "world cup", venue: "Chennai", country: "IN", city: "Bangalore", start_date: "2017-12-19 00:00:00", end_date: "2020-12-20 00:00:00", type: "Cricket")

Event.create(name: "Beach Soccer", venue: "ba",ngaloor country: "IN", city: "Bangalore", start_date: "2017-12-19 00:00:00", end_date: "2020-12-20 00:00:00", type: "Footbal")


#to create an speaker

Speaker.create(name: "manik chand vikram mudliyar", country: India)
Speaker.create(name: "Sivaram", country: England)

#to create an sponsor

Sponsor.create(name: "Harishankar", country: India)
Sponsor.create(name: "Ajay", country: England)