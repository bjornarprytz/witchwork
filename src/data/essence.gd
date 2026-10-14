class_name Essence
extends Resource

## A property of materia

enum Type {
	# Basic
	Rooted,
	Crystalline,
	Flowing,
	Vital,
	Vestigial,
	Threshold,
	Celestial,
	
	# Esoteric
	Discord,
	Kin,
	Ward,
	Command,
	Secret,
}

static var pie_basic: Array[Type] = [
	Type.Rooted,
	Type.Crystalline,
	Type.Flowing,
	Type.Vital,
	Type.Vestigial,
	Type.Threshold,
	Type.Celestial
]

static var pie_esoteric: Array[Type] = [
	Type.Discord,
	Type.Kin,
	Type.Ward,
	Type.Command,
	Type.Secret
]

static func is_esoteric(type: Type) -> bool:
	return int(type) >= int(Type.Discord)

static func is_basic(type: Type) -> bool:
	return !is_esoteric(type)

static func group_intensities(inputs: Array[Materia]) -> Dictionary[Type, int]:
	var grouping: Dictionary[Essence.Type, int] = {}
	
	for m in inputs:
		for e in m.essences:
			if grouping.has(e):
				grouping[e] += m.intensity
			else:
				grouping[e] = m.intensity
	
	return grouping
