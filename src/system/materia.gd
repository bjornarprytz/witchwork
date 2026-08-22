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

static func random_essence() -> Essence:
	return Essence.values().pick_random()

static func random_element() -> Element:
	return Element.values().pick_random()

static func next_phase(current: Phase) -> Phase:
	match current:
		Phase.Dormant:
			return Phase.Awake
		Phase.Awake:
			return Phase.Risen
		Phase.Risen:
			return Phase.Dormant
		_:
			push_error("Unrecognized phase: %s" % current)
			return Phase.Dormant
	

static func random() -> Materia:
	var m = Materia.new()
	m.essence = random_essence()
	m.element = random_element()
	m.phase = [Phase.Dormant, Phase.Awake].pick_random()
	m.age = randi() % 10
	
	return m

func _to_string() -> String:
	return "%s/%s" % [essence, element]
