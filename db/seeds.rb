# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create({name:'Bob', password:'pw'})
user2 = User.create({name: 'Sue', password: 'pw'})

drink1 = Drink.create({name: 'Bloody Mary', description: 'tomatoey'})
drink2 = Drink.create({name: 'Vodka Martini'})
drink3 = Drink.create({name: 'Daquiri', description: 'sweet, sour, and strong'})
drink4 = Drink.create({name: 'Margarita', description: 'a party starter'})

ing1 = Ingredient.create({name: 'tomato juice'})
ing2 = Ingredient.create({name: 'Vodka'})
ing4 = Ingredient.create({name: 'White Rum'})
ing5 = Ingredient.create({name: 'Lime Juice'})
ing6 = Ingredient.create({name: 'Simple Syrup'})
ing7 = Ingredient.create({name: 'Tequila'})
ing8 = Ingredient.create({name: 'Cointreau'})
ing9 = Ingredient.create({name: 'Vermouth'})


Review.create([{user: user1, drink: drink1, content: 'too tomatoey', rating: 3},
  {user: user1, drink: drink2, content: 'too olivey', rating: 2},
  {user: user1, drink: drink3, content: 'not what I expected', rating: 4},
  {user: user1, drink: drink4, content: 'better with salt', rating: 4},
  {user: user2, drink: drink1, content: 'tasty', rating: 5}])



user1.drinks << [drink1, drink2, drink3]
user2.drinks << [drink4, drink2, drink3]

DrinksIngredient.create({drink: drink1, ingredient: ing1, parts: 2})
DrinksIngredient.create(drink: drink1, ingredient: ing2, parts: 1)
DrinksIngredient.create(drink: drink2, ingredient: ing2, parts: 2)
DrinksIngredient.create(drink: drink2, ingredient: ing9, parts: 1)
DrinksIngredient.create(drink: drink3, ingredient: ing4, parts: 2)
DrinksIngredient.create(drink: drink3, ingredient: ing5, parts: 1)
DrinksIngredient.create(drink: drink3, ingredient: ing6, parts: 1)
DrinksIngredient.create(drink: drink4, ingredient: ing5, parts: 1)
DrinksIngredient.create(drink: drink4, ingredient: ing7, parts: 2)
DrinksIngredient.create({drink: drink4, ingredient: ing8, parts: 1})
