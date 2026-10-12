class_name FreeformPotionConcoction
extends Resource

var ingredients: Array[Materia]

func resolve() -> Potion:
	var pentagram = Pentagram.new(ingredients)
	var charge = pentagram.get_charge()
	
	var potion = Potion.new()
	
	## TODO: Add alterations based on the freeform rules
	
	return potion
