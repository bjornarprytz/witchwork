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

var type: Type

func equals(other: Alignment):
	return compare(other) == 0

func compare(other: Alignment) -> int:
	return int(type) - int(other.type)
