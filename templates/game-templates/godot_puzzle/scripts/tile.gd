extends Control

@export var tile_id: int = 0
var _selected := false

signal tile_pressed(tile: Control)

func _ready() -> void:
	gui_input.connect(_on_gui_input)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		tile_pressed.emit(self)

func set_selected(v: bool) -> void:
	_selected = v
	modulate = Color(1, 1, 0.4, 1) if v else Color(1, 1, 1, 1)
