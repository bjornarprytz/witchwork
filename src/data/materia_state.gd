class_name MateriaState
extends Resource

## The physical state a materia is in

enum Type {
	Raw,
	Dried,
	Powder,
	Paste,
	Fermented,
	Liquid,
	Ash
}

var type: Type
