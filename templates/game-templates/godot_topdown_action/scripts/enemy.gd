extends CharacterBody2D

enum State { PATROL, CHASE }
var current_state := State.PATROL
var player: Node2D = null
@export var patrol_points: Array[Vector2] = []
var patrol_index := 0
@export var chase_speed: float = 140.0
@export var patrol_speed: float = 70.0

@onready var detection: Area2D = $Detection

func _ready() -> void:
	detection.body_entered.connect(_on_detection_body_entered)
	detection.body_exited.connect(_on_detection_body_exited)

func _physics_process(delta: float) -> void:
	match current_state:
		State.PATROL:
			_patrol()
		State.CHASE:
			_chase()

func _patrol() -> void:
	if patrol_points.is_empty():
		velocity = Vector2.ZERO
		move_and_slide()
		return
	var target := patrol_points[patrol_index]
	velocity = (target - global_position).normalized() * patrol_speed
	if global_position.distance_to(target) < 8.0:
		patrol_index = (patrol_index + 1) % patrol_points.size()
	move_and_slide()

func _chase() -> void:
	if player == null:
		current_state = State.PATROL
		return
	velocity = (player.global_position - global_position).normalized() * chase_speed
	move_and_slide()

func _on_detection_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player = body
		current_state = State.CHASE

func _on_detection_body_exited(body: Node) -> void:
	if body == player:
		player = null
		current_state = State.PATROL
