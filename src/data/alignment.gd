class_name Alignment
extends Resource

## Elemental alignment

enum Type {
	Earth,
	Water,
	Air,
	Fire,
	Spirit
}

static var pie: Array[Type] = [
	Type.Spirit,
	Type.Water,
	Type.Fire,
	Type.Earth,
	Type.Air
]

static func equals(a: Type, b: Type):
	return compare(a, b) == 0

static func compare(a: Type, b: Type) -> int:
	return int(a) - int(b)
