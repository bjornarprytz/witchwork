class_name RitualContext
extends Resource

var ritual: Ritual
var input_materia: Array[Materia]

func resolve() -> Array[Materia]:
	var output : Array[Materia] = input_materia.duplicate()
	
	for shift in ritual.outcomes:
		output = shift.resolve(output)
	
	return output
