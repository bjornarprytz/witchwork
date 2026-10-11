class_name Pentagram
extends Resource

var _order = [
	Alignment.Type.Spirit, 
	Alignment.Type.Water, 
	Alignment.Type.Fire, 
	Alignment.Type.Earth, 
	Alignment.Type.Air
]

var intent: Materia
var threading_left: Materia
var threading_right: Materia
var grounding_left: Materia
var grounding_right: Materia

func _init(inputs: Array[Materia]) -> void:
	intent = _find_intent(inputs)
	inputs.erase(intent)
	
	## TODO: Find the other points of the pentagram, based on the intent and the _order

## True: Positive charge
func get_charge() -> bool:
	var charge := 0
	if (threading_left != null):
		charge -= threading_left.intensity
	if (grounding_left != null):
		charge -= grounding_left.intensity
	
	if (threading_right != null):
		charge += threading_right.intensity
	if (grounding_right != null):
		charge += grounding_right.intensity
	
	if (charge == 0):
		return intent.intensity % 2 == 0
	
	return charge > 0

func _find_intent(inputs: Array[Materia])  -> Materia:
	var max := 0
	var current_intent: Materia
	
	for m in inputs:
		if m.intensity < max:
			continue
		if m.intensity == max:
			if m.alignment.compare(current_intent.alignment) > 0:
				current_intent = m
		else:
			current_intent = m
	
	assert(current_intent != null)
	
	return current_intent


	
	
