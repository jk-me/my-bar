# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create({name:'bob', password:'pw'})
user2 = User.create({name: 'sue', password: 'pw'})

drink1 = Drink.create({name: 'bloody mary', description: 'tomatoey'})
drink2 = Drink.create({name: 'vodka martini'})

ing1 = Ingredient.create({name: 'tomato juice'})
ing2 = Ingredient.create({name: 'vodka'})
ing3 = Ingredient.create({name: 'olives'})

rev1 = Review.create(content: 'too tomatoey')
rev2 = Review.create(content: 'too olivey')

user1.drinks << drink1

user1.reviews << rev1

drink1.ingredients << [ing1, ing2]
drink2.ingredients << [ing2, ing3]

drink1.reviews << rev1
