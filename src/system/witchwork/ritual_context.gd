class_name RitualContext
extends Resource

var ritual: Ritual
var potions: Array[Potion] = []
var input_materia: Array[Materia] = []

func _init(ritual_: Ritual) -> void:
	assert(ritual_ != null)
	ritual = ritual_

func resolve() -> Array[Materia]:
	var output : Array[Materia] = input_materia.duplicate()
	
	for shift in ritual.outcomes:
		output = shift.resolve(output)
	
	return output

func validate_materia(materia: Materia) -> bool:
	return ritual.validate_materia(materia)

func add_materia(materia: Materia) -> bool:
	assert(!input_materia.has(materia))
	if !validate_materia(materia):
		return false
	input_materia.append(materia)
	
	return true

func remove_materia(materia: Materia):
	assert(input_materia.has(materia))
	input_materia.erase(materia)

func add_potion(potion: Potion) -> bool:
	assert(!potions.has(potion))
	if (!potion.can_apply_to_ritual(ritual)):
		return false
		
	potions.append(potion)
	
	return true

func remove_potion(potion: Potion):
	assert(potions.has(potion))
	potions.erase(potion)
	
