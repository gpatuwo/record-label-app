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
Band.create!(name: "Kiasmos")
Band.create!(name: "Peter Broderick")
Band.create!(name: "Rival Consoles")

Album.create!(title: "Trance Frendz", band_id:1, year:2016, live:true)
Album.create!(title: "Late Night Tales: Nils Frahm", band_id:1, year:2015, live:false)
Album.create!(title: "Trance Frendz", band_id:2, year:2016, live:true)
Album.create!(title: "The Chopin Project", band_id:2, year:2015, live:true)
Album.create!(title: "Kiasmos", band_id:3, year:2014, live:false)

Track.create!(title:"20:17", album_id:1, ord:1, bonus:false, lyrics:"instrumental")
Track.create!(title:"12:05", album_id:1, ord:2, bonus:false, lyrics:"instrumental")
Track.create!(title:"04:33", album_id:2, ord:1, bonus:false, lyrics:"instrumental")
Track.create!(title:"Liquindi 2", album_id:2, ord:2, bonus:false, lyrics:"instrumental")
