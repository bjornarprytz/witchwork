class_name CellUI
extends PanelContainer

var cell: Cell

@onready var element_symbol: TextureRect = %ElementSymbol
@onready var age_label: RichTextLabel = %AgeLabel
@onready var phase_label: RichTextLabel = %PhaseLabel

func _ready() -> void:
	_update_ui()
	cell.materia_changed.connect(on_materia_changed)

func on_materia_changed(_m):
	_update_ui()

func _update_ui():
	if (cell.materia == null):
		element_symbol.texture = preload("res://assets/img/icon.svg")
		element_symbol.modulate = Color.WHITE
		phase_label.clear()
		age_label.clear()
		tooltip_text = "empty"
		return
	
	element_symbol.texture = Materia.get_elemental_symbol(cell.materia.element)
	element_symbol.modulate = Materia.get_essence_color(cell.materia.essence)
	phase_label.text = Materia.get_phase_indicator(cell.materia.phase)
	age_label.text = "%d" % cell.materia.age
	tooltip_text = "%s" % cell.materia
