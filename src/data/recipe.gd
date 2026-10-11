class_name Recipe
extends Resource

## When a potion concoction matches the requirements exactly, the outcome happens

var requirements: Array[MateriaRequirementsSpec]
var result: Potion


## Check whether the ingredients match the requirements
func match_ingredients(ingredients: Array[Materia]) -> bool:
	## TODO: Matching ingredients might actually be more complicated than this algo assumes, if certain requirements can be met by multiple ingredients
	if (ingredients.size() != requirements.size()):
		return false
	
	var remaining_requirements = requirements.duplicate()
	var remaining_ingredients = ingredients.duplicate()
	
	while remaining_requirements.size() > 0:
		var r = remaining_requirements.pop_front() as MateriaRequirementsSpec
		
		for i in remaining_ingredients:
			if r.match_materia(i):
				remaining_ingredients.erase(i)
				break
		
		if (remaining_ingredients.size() != remaining_requirements.size()):
			return false

	return true
