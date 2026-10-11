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

var type: Type

func is_esoteric() -> bool:
	return int(type) >= int(Type.Discord)

func is_basic() -> bool:
	return !is_esoteric()
