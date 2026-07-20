extends Node2D

const OBSTACLE := preload("res://scenes/obstacle.tscn")
@export var scroll_speed: float = 240.0
@export var spawn_interval: float = 1.4
var _game_over := false

@onready var spawn_timer: Timer = $SpawnTimer
@onready var ground: Node2D = get_node("../Ground")

func _ready() -> void:
	spawn_timer.wait_time = spawn_interval
	spawn_timer.timeout.connect(_on_spawn)
	spawn_timer.start()

func _process(delta: float) -> void:
	if _game_over:
		return
	# Zemin sola akar (tile offset hissi)
	ground.position.x -= scroll_speed * delta
	if ground.position.x <= -512:
		ground.position.x = 0

func _on_spawn() -> void:
	if _game_over:
		return
	var o := OBSTACLE.instantiate()
	o.position = Vector2(1100, 540)
	get_parent().add_child(o)

func game_over() -> void:
	_game_over = true
	spawn_timer.stop()
	print("Oyun bitti!")
