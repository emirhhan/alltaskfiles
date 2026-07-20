extends CharacterBody2D

@export var speed: float = 90.0
var player: Node2D = null

func _physics_process(delta: float) -> void:
	if player != null:
		velocity = (player.global_position - global_position).normalized() * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
