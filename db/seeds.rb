# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

House.create!([
  {
    title: 'しかの心',
    owner_type: 'individual',
    owner: 'ほげ',
    address: '鳥取県鳥取市鹿野町鹿野１８０９−１',
    first_vacant_year: 2015,
    latitude: 35.4605753,
    longitude: 134.0638556,
  }
])

