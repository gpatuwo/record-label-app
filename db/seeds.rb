# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "grace1", password: "pass123")
User.create!(email: "grace2", password: "pass123")
User.create!(email: "grace3", password: "pass123")

Band.create!(name: "Nils Frahm")
Band.create!(name: "Olafur Arnalds")
Band.create!(name: "Peter Broderick")
Band.create!(name: "Kiasmos")
Band.create!(name: "Rival Consoles")
