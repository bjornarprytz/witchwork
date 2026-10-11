class_name PotionConcoction
extends Resource

class Context:
	var recipes: Array[Recipe]

var ingredients: Array[Materia]
var result: Potion

func update_result(context: Context):	
	for r in context.recipes:
		if (r.match_ingredients(ingredients)):
			result = r.result
			return
	
	result = _determine_freeform_result()
	

func _determine_freeform_result() -> Potion:
	var pentagram = Pentagram.new(ingredients)
	var charge = pentagram.get_charge()
	
	var potion = Potion.new()
	
	## TODO: Add alterations based on the freeform rules
	
	return potion
