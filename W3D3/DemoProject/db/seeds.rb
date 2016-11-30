# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brannan = House.create(address: "683 Brannan Street")
holly = House.create(address: "123 Holly Oak Drive")

chloe = Person.create(name: "Chloe", house_id: brannan.id)
jessie = Person.create(name: "Jessie", house_id: brannan.id)
mommy = Person.create(name: "Jodie", house_id: holly.id)
