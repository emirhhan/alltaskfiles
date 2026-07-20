# Godot Recipes — İndeks

Godot 4.x (GDScript) için 13 sistem tarifi. Her dosya `recipes/godot/<sistem>.yaml`
formatındadır (Bölüm 7'ye uygun).

| Recipe | Sistem | Validation |
|---|---|---|
| `character_movement.yaml` | Karakter hareketi (CharacterBody2D) | movement_works, diagonal_speed_normalized, collision_works, mobile_input_supported |
| `camera.yaml` | Kamera (Camera2D) | camera_follows_target, camera_smoothing_works, camera_limits_respected |
| `input.yaml` | Input (InputMap) | keyboard_input_works, gamepad_input_works, action_remapping_supported |
| `collision.yaml` | Çarpışma (CollisionShape2D/Area2D) | collision_works, overlap_detection_works, layer_mask_configured |
| `save_load.yaml` | Save/Load (FileAccess+JSON) | save_writes_file, load_reads_file, corrupt_file_handled |
| `menu_ui.yaml` | Menü/UI (Control) | ui_renders, button_press_works, scene_transition_works |
| `enemy_ai.yaml` | Düşman AI (state machine) | patrol_works, chase_triggers_on_detection, attack_in_range |
| `spawn_system.yaml` | Spawn sistemi (Timer) | spawn_creates_instance, spawn_respects_max_count, spawn_random_position |
| `object_pooling.yaml` | Object pooling | pool_prefilled, acquire_returns_inactive, release_returns_to_pool |
| `damage_health.yaml` | Hasar/Sağlık | damage_reduces_health, invincibility_frames_work, death_triggers |
| `audio.yaml` | Ses (AudioStreamPlayer) | sfx_plays, music_loops, volume_control_works |
| `mobile_control.yaml` | Mobil kontrol (touch) | touch_detected, virtual_joystick_works, mobile_input_supported |
| `web_windows_build.yaml` | Web/Windows build | web_build_runs_in_browser, windows_build_runs, export_preset_configured |

## İlgili
- Template'ler: `templates/game-templates/godot_*`
- Motor profili: `engine-profiles/godot.yaml`
- Bilinen hatalar: `known-errors/godot.md`
- Resmî kaynak: `official-sources/godot.md`
