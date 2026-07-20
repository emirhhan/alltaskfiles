extends Node2D

const COLS := 4
const ROWS := 4
const TILE_SCENE := preload("res://scenes/tile.tscn")

var _selected: Array[Control] = []
var _matches := 0

func _ready() -> void:
	for r in ROWS:
		for c in COLS:
			var t := TILE_SCENE.instantiate()
			t.tile_id = randi() % 4
			t.position = Vector2(100 + c * 80, 100 + r * 80)
			t.tile_pressed.connect(_on_tile_pressed)
			add_child(t)

func _on_tile_pressed(tile: Control) -> void:
	if _selected.has(tile):
		return
	tile.set_selected(true)
	_selected.append(tile)
	if _selected.size() >= 2:
		_check_match()

func _check_match() -> void:
	var a := _selected[0]
	var b := _selected[1]
	if a.tile_id == b.tile_id:
		_matches += 1
		print("Eşleşme! Toplam: ", _matches)
		a.queue_free()
		b.queue_free()
	else:
		a.set_selected(false)
		b.set_selected(false)
	_selected.clear()
