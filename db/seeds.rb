# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'James', email: 'james.carney@vshift.com', password: 'tum42069')
User.create!(name: 'Vincent', email: 'vincent.chin@vshift.com', password: 'v-moneyyy')
User.create!(name: 'Schyler', email: 'schyler.hosler@vshift.com', password: 'sane_password')
User.create!(name: 'Gerson', email: 'gerson.mejia@vshift.com', password: 'gimmanager')

Restaurant.create!(name: 'Good Seed', menu_url: 'https://www.goodseedsalad.com/food-and-drink.html')
Restaurant.create!(name: 'Sticky\'s Finger Joint', menu_url: 'https://www.yelp.com/menu/stickys-finger-joint-new-york', note: 'remember to pick some sauces')
Restaurant.create!(name: 'Ramen Takumi', menu_url: 'https://www.seamless.com/menu/ramen-takumi-517-3rd-ave-new-york/285723')