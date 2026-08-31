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

## Assumes ordered arrays of prime factors. Returns negative if a < b, 0 if they're equal
static func numeric_compare(a: Array[int], b: Array[int]) -> int:
	assert (!a.is_empty() || !b.is_empty())
	if (a.size() != b.size()):
		return a.size() - b.size()
	else:
		return a[0] - b[0]

func get_numeric_alignment() -> Array[int]:
	var value = int(essence) + int(element) + age
	return compute_prime_factors(value)
	
static func compute_prime_factors(v: int) -> Array[int]:
	if (v <= 1):
		return [1]
	var primes_to_test: Array[int] = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199]
	var factors: Array[int] = []
	for p in primes_to_test:
		if (p > v):
			break
		while v % p == 0:
			factors.push_front(p)
			@warning_ignore("integer_division")
			v = v/p
	while v % 2 == 0:
		factors.append(2)
		@warning_ignore("integer_division")
		v = v/2
	assert(v == 1)
	return factors

func copy() -> Materia:
	var c = Materia.new()
	
	c.age = self.age
	c.element = self.element
	c.essence = self.essence
	c.phase = self.phase
	
	return c

static func random_essence(except: Array[Essence]=[]) -> Essence:
	var e = Essence.values().pick_random()
	if (except.is_empty()):
		return e
	while (except.has(e)):
		e = Materia.random_essence()
	return e

static func random_element(except: Array[Element]=[]) -> Element:
	var e = Element.values().pick_random()
	if (except.is_empty()):
		return e
	while (except.has(e)):
		e = Materia.random_element()
	return e

static func random() -> Materia:
	var m = Materia.new()
	m.essence = random_essence()
	m.element = random_element()
	m.phase = [Phase.Dormant, Phase.Awake].pick_random()
	m.age = randi() % 10
	
	return m

static func get_elemental_symbol(e: Element) -> Resource:
	match e:
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
	
	push_error("Invalid element: %s" % e)
	return null

static func get_essence_color(e: Essence) -> Color:
	match e:
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

static func get_phase_indicator(p: Phase) -> String:
	match p:
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
