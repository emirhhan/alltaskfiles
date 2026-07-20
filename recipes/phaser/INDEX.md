# Phaser Recipes — İndeks

Phaser 3 (JavaScript) için 13 sistem tarifi. Her dosya `recipes/phaser/<sistem>.yaml`
formatındadır (Bölüm 7'ye uygun).

| Recipe | Sistem | Validation |
|---|---|---|
| `character_movement.yaml` | Karakter hareketi (Arcade Physics) | movement_works, diagonal_speed_normalized, collision_works, mobile_input_supported |
| `camera.yaml` | Kamera (startFollow) | camera_follows_target, camera_smoothing_works, camera_limits_respected |
| `input.yaml` | Input (keyboard/pointer/gamepad) | keyboard_input_works, gamepad_input_works, action_remapping_supported |
| `collision.yaml` | Çarpışma (collider/overlap) | collision_works, overlap_detection_works, layer_mask_configured |
| `save_load.yaml` | Save/Load (localStorage) | save_writes_file, load_reads_file, corrupt_file_handled |
| `menu_ui.yaml` | Menü/UI (Text/Rectangle) | ui_renders, button_press_works, scene_transition_works |
| `enemy_ai.yaml` | Düşman AI (state machine) | patrol_works, chase_triggers_on_detection, attack_in_range |
| `spawn_system.yaml` | Spawn sistemi (Timer) | spawn_creates_instance, spawn_respects_max_count, spawn_random_position |
| `object_pooling.yaml` | Object pooling (group+maxSize) | pool_prefilled, acquire_returns_inactive, release_returns_to_pool |
| `damage_health.yaml` | Hasar/Sağlık | damage_reduces_health, invincibility_frames_work, death_triggers |
| `audio.yaml` | Ses (this.sound) | sfx_plays, music_loops, volume_control_works |
| `mobile_control.yaml` | Mobil kontrol (pointer/Scale) | touch_detected, virtual_joystick_works, mobile_input_supported |
| `web_windows_build.yaml` | Web/Windows build (Vite/Electron) | web_build_runs_in_browser, windows_build_runs, export_preset_configured |

## İlgili
- Template'ler: `templates/game-templates/phaser_*`
- Motor profili: `engine-profiles/phaser.yaml`
- Bilinen hatalar: `known-errors/phaser.md`
- Resmî kaynak: `official-sources/phaser.md`
