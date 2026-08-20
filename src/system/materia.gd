class_name Materia
extends Resource

enum Essence {
	Rooted,
	Crystalline,
	Flowing,
	Vital,
	Burnt,
	Threshold,
	Celestial
}

enum Element {
	Earth,
	Water,
	Air,
	Fire,
	Aether
}

enum Phase {
	Dormant,
	Awake,
	Risen
}

var essence: Essence
var element: Element
var phase: Phase
var age: int

static func random() -> Materia:
	var m = Materia.new()
	m.essence = Essence.values().pick_random()
	m.element = Element.values().pick_random()
	m.phase = [Phase.Dormant, Phase.Awake].pick_random()
	m.age = randi() % 10
	
	return m

func _to_string() -> String:
	return "%s/%s" % [essence, element]
