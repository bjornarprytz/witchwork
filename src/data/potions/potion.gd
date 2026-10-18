class_name Potion
extends Resource

var alterations: Array[Alteration]

var potential_release: Array[Potential.Release] = []
var potential_bind: Array[Potential.Bind] = []

func can_apply_to_ritual(ritual: Ritual) -> bool:
	push_error("Not implemented yet...")
	
	return false
