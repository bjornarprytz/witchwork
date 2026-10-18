class_name ChangeEssenceShift
extends Shift

var target_essence: Essence.Type


func resolve(input: Array[Materia]) -> Array[Materia]:
	for i in input:
		i.essence = target_essence
	
	return input
