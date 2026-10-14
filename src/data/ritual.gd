class_name Ritual
extends Resource

## A ritual card

@export var name: String
var input_requirements: Array[MateriaRequirementsSpec]
var outcomes: Array[Shift]


func validate_materia(materia: Materia) -> bool:
	push_error("Not implemented yet..")
	return false
