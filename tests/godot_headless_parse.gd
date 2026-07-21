extends SceneTree

# Godot headless parse testi: her template'in main.tscn sahnesini yükler ve
# hata olup olmadığını raporlar. Çalıştırma:
#   godot --headless --script tests/godot_headless_parse.gd
# Çıkış kodu: tüm sahneler parse edilirse 0, aksi halde 1.

const TEMPLATES := [
	"res://scenes/main.tscn",
]

var _failures := 0

func _initialize() -> void:
	var base_dirs := [
		"godot_2d_platformer",
		"godot_endless_runner",
		"godot_idle_clicker",
		"godot_puzzle",
		"godot_survivors_like",
		"godot_topdown_action",
	]
	var ok := true
	for tpl in base_dirs:
		var path := "res://templates/game-templates/%s/scenes/main.tscn" % tpl
		var err := _parse_scene(path)
		if err != OK:
			ok = false
			_failures += 1
		print("[parse] %s -> %s" % [path, "OK" if err == OK else "FAIL (%d)" % err])
	# Ek olarak puzzle tile.tscn ve endless runner player.tscn / obstacle.tscn
	for extra in [
		"res://templates/game-templates/godot_puzzle/scenes/tile.tscn",
		"res://templates/game-templates/godot_endless_runner/scenes/player.tscn",
		"res://templates/game-templates/godot_endless_runner/scenes/obstacle.tscn",
		"res://templates/game-templates/godot_topdown_action/scenes/player.tscn",
		"res://templates/game-templates/godot_topdown_action/scenes/enemy.tscn",
		"res://templates/game-templates/godot_survivors_like/scenes/player.tscn",
		"res://templates/game-templates/godot_survivors_like/scenes/enemy.tscn",
	]:
		var err := _parse_scene(extra)
		if err != OK:
			ok = false
			_failures += 1
		print("[parse] %s -> %s" % [extra, "OK" if err == OK else "FAIL (%d)" % err])
	print("=== Godot headless parse: %s (%d failure) ===" % ["PASS" if ok else "FAIL", _failures])
	quit(0 if ok else 1)

func _parse_scene(path: String) -> int:
	var packed := load(path)
	if packed == null:
		return ERR_CANT_OPEN
	if not (packed is PackedScene):
		return ERR_INVALID_DATA
	var inst := packed.instantiate()
	if inst == null:
		return ERR_CANT_CREATE
	inst.queue_free()
	return OK
