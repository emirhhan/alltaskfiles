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

	# Yalnızca yatay hızı sınırla; dikey (yerçekimi/zıplama) korunur.
	# NOT: Tüm vektörü normalize etmek zıplamayı speed (300) sınırına hapseder,
	# jump_velocity (-500) ölürdü. Bu yüzden sadece velocity.x clamp'lenir.
	velocity.x = clampf(velocity.x, -speed, speed)

	move_and_slide()
