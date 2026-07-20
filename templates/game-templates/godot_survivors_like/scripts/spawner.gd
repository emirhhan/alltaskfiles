extends Node2D

const ENEMY := preload("res://scenes/enemy.tscn")
@export var pool_size: int = 40
@export var spawn_interval: float = 1.0

var _pool: Array[Node2D] = []
var _wave := 0

@onready var timer: Timer = $SpawnTimer

func _ready() -> void:
	for i in pool_size:
		var e := ENEMY.instantiate()
		e.visible = false
		e.process_mode = Node.PROCESS_MODE_DISABLED
		add_child(e)
		_pool.append(e)
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_spawn)
	timer.start()

func _on_spawn() -> void:
	_wave += 1
	var e := _acquire()
	if e == null:
		return
	e.global_position = Vector2(randf_range(0, 1024), randf_range(0, 600))
	e.visible = true
	e.process_mode = Node.PROCESS_MODE_INHERITED

func _acquire() -> Node2D:
	for e in _pool:
		if not e.visible:
			return e
	return null
