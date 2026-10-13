class_name PotionConcoctionContext
extends Resource

var ingredients: Array[Materia]

var outcome_preview: Potion

func add_ingredient(materia: Materia):
	ingredients.push_back(materia)
	_refresh_preview()

func resolve() -> Potion:
	_refresh_preview()
	return outcome_preview

func _refresh_preview():
	outcome_preview = _determine_outcome()

func _determine_outcome() -> Potion:
	
	var inputs: Dictionary[Alignment.Type, Materia] = {}
	
	for i in ingredients:
		assert(!inputs.has(i.alignment))
		inputs[i.alignment] = i
	
	var pentagram = Pentagram.new(inputs)
	var intent = pentagram.get_charge()
	var charge = pentagram.get_charge()
	
	## TODO: Determine the potion function ([POTENTIAL release/bind] or [Alteration])
	
	var potion = Potion.new()
	
	##
	
	return potion
