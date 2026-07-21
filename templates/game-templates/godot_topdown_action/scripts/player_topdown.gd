extends CharacterBody2D

@export var speed: float = 220.0
@export var max_health: int = 100
var health: int = max_health
var _invincible := false

@onready var hurtbox: Area2D = $Hurtbox
@onready var iframes: Timer = $IFrames

func _ready() -> void:
	hurtbox.area_entered.connect(_on_hurtbox_area_entered)
	iframes.timeout.connect(_on_iframes_timeout)

func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = dir * speed
	move_and_slide()

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_hitbox") and not _invincible:
		take_damage(10)

func take_damage(amount: int) -> void:
	health -= amount
	_invincible = true
	iframes.start()
	modulate = Color(1, 0.3, 0.3, 0.6)
	if health <= 0:
		_die()

func _on_iframes_timeout() -> void:
	_invincible = false
	modulate = Color(1, 1, 1, 1)

func _die() -> void:
	queue_free()
