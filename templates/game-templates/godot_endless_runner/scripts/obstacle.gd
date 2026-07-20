extends CharacterBody2D

@export var move_speed: float = 240.0

func _physics_process(delta: float) -> void:
	velocity.x = -move_speed
	move_and_slide()
	if global_position.x < -100:
		queue_free()
