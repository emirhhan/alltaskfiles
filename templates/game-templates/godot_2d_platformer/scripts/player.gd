extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_velocity: float = -500.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Çapraz normalizasyon
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed

	move_and_slide()
