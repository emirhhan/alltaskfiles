extends Node2D

@export var enemy_scene: PackedScene
@export var pool_size: int = 60

var pool: Array[Node2D] = []

func _ready() -> void:
	for i in pool_size:
		var obj: Node2D = enemy_scene.instantiate()
		obj.visible = false
		obj.process_mode = Node.PROCESS_MODE_DISABLED
		obj.add_to_group("enemy")
		add_child(obj)
		pool.append(obj)

func spawn(pos: Vector2) -> Node2D:
	var obj := _get_inactive()
	if obj == null:
		return null
	obj.global_position = pos
	obj.visible = true
	obj.process_mode = Node.PROCESS_MODE_INHERIT
	return obj

func deactivate(obj: Node2D) -> void:
	obj.visible = false
	obj.process_mode = Node.PROCESS_MODE_DISABLED

func _get_inactive() -> Node2D:
	for obj in pool:
		if not obj.visible:
			return obj
	return null
