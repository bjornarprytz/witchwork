class_name Essence
extends Resource

## A property of materia

enum Type {
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

static func is_esoteric(type: Type) -> bool:
	return int(type) >= int(Type.Discord)

static func is_basic(type: Type) -> bool:
	return !is_esoteric(type)
