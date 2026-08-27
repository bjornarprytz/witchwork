class_name TheTurningUI
extends VBoxContainer

var cell_factory: PackedScene = preload("res://interface/cell_ui.tscn")

var _turning: TheTurning

@onready var board: GridContainer = %Board

func load_turning(turning: TheTurning):
	for c in board.get_children():
		c.queue_free()
	
	_turning = turning
	board.columns = _turning.board.width
	
	for c in turning.board.cells:
		var cell_ui = cell_factory.instantiate() as CellUI
		cell_ui.cell = c
		board.add_child(cell_ui)

func next_turn():
	_turning.turn()
