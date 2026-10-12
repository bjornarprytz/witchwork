class_name AddEssenceShift
extends Shift

var target_essence: Essence.Type


func resolve(input: Array[Materia]) -> Array[Materia]:
	for i in input:
		if !i.essences.has(target_essence):
			i.essences.push_back(target_essence)
	
	return input
