class_name TheTurning
extends RefCounted

## The environment
var _board: Board
var _width: int
var _height: int
var _turn_number: int

func turn() -> Turn:
	var t = Turn.new(_board)
	t.resolve()
	return t

func _init(size:int):
	_board = Board.new(size,size)
	_seed_materia()

func _seed_materia():
	for x in range(_width):
		for y in range(_height):
			_board.add(Cell.new(x,y,Materia.random()))
