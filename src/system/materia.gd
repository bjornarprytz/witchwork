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

func copy() -> Materia:
	var c = Materia.new()
	
	c.age = self.age
	c.element = self.element
	c.essence = self.essence
	c.phase = self.phase
	
	return c

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

static func get_elemental_symbol(element: Element) -> Resource:
	match element:
		Materia.Element.Earth:
			return preload("res://assets/img/earth.png")
		Materia.Element.Air:
			return preload("res://assets/img/air.png")
		Materia.Element.Aether:
			return preload("res://assets/img/spirit.png")
		Materia.Element.Fire:
			return preload("res://assets/img/fire.png")
		Materia.Element.Water:
			return preload("res://assets/img/water.png")
	
	push_error("Invalid element: %s" % element)
	return null

static func get_essence_color(essence: Essence) -> Color:
	match essence:
		Materia.Essence.Rooted:
			return Color(0.2, 0.5, 0.2)
		Materia.Essence.Crystalline:
			return Color(0.5, 0.5, 1.0)
		Materia.Essence.Flowing:
			return Color(0.2, 0.5, 1.0)
		Materia.Essence.Vital:
			return Color(1.0, 0.5, 0.2)
		Materia.Essence.Burnt:
			return Color(0.5, 0.2, 0.2)
		Materia.Essence.Threshold:
			return Color(0.5, 0.5, 0.5)
		Materia.Essence.Celestial:
			return Color(1.0, 1.0, 1.0)
	return Color.HOT_PINK

static func get_phase_indicator(phase: Phase) -> String:
	match phase:
		Materia.Phase.Dormant:
			return "."
		Materia.Phase.Awake:
			return ".."
		Materia.Phase.Risen:
			return "..."
	return "x"

func _to_string() -> String:
	var essence_str = Essence.keys()[essence]
	var element_str = Element.keys()[element]
	return "%s/%s" % [essence_str, element_str]
