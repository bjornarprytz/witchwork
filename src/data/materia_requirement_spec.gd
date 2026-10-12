class_name MateriaRequirementsSpec
extends Resource

var essences: Array[Essence.Type]
var states: Array[MateriaState.Type]
var alignments: Array[Alignment.Type]

func match_materia(materia: Materia) -> bool:
	if (essences.size() > 0):
		if (materia.essences.size() == 0):
			return false
		var matching_essence = false
		for e in materia.essences:
			if essences.has(e):
				matching_essence = true
				break
		if (!matching_essence):
			return false
	
	if (states.size() > 0):
		if (!states.has(materia.state)):
			return false
	
	if (alignments.size() > 0):
		if (!alignments.has(materia.alignment.type)):
			return false
	
	return true
