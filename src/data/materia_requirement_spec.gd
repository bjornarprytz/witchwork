class_name MateriaRequirementsSpec
extends Resource

var essences: Array[Essence.Type]
var states: Array[MateriaState.Type]
var alignments: Array[Alignment.Type]

func match_materia(materia: Materia) -> bool:
	if (essences.size() > 0):
		var matching_essence = false
		if essences.has(materia.essence):
			matching_essence = true
		if (!matching_essence):
			return false
	
	if (states.size() > 0):
		if (!states.has(materia.state)):
			return false
	
	if (alignments.size() > 0):
		if (!alignments.has(materia.alignment)):
			return false
	
	return true
