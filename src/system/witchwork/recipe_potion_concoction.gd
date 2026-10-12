class_name RecipePotionConcoction
extends Resource

var recipe: Recipe
var ingredients: Array[Materia]
var result: Potion

func resolve() -> Potion:
	assert(recipe.match_ingredients(ingredients))
	
	return recipe.result
