# Version Compatibility Matrix

> Godot 4.x ve Phaser 3.x sürümleri arası uyum, kırıcı değişiklikler ve
> karşılaştırmalı öneriler. Güncel sürümler `engine-profiles/` altında.

---

## 1. Godot 3.x → 4.x Kırıcı Değişiklikler

| Konu | Godot 3.x | Godot 4.x | Not |
|---|---|---|---|
| Fizik callback | `_physics_process` | `_physics_process(delta)` | delta artık parametre |
| Node referansı | `onready var x = $Child` | `@onready var x = $Child` | `@onready` zorunlu |
| Fonksiyon | `func _ready()` | `func _ready() -> void` | dönüş tipi opsiyonel ama önerilir |
| GDScript | `export var x` | `@export var x` | `@export` anotasyonu |
| Signal bağlama | `connect("sig", self, "cb")` | `signal.connect(cb)` | yeni API |
| String | `"%s" % v` | `"%s" % v` | aynı (format korundu) |
| TileMap | `TileMap` | `TileMapLayer` (4.3+) | yeni node önerilir |
| Material | `CanvasItemMaterial` | aynı | — |

**Kural:** Recipe'ler Godot 4.x syntax'ı kullanır. 3.x projesi devralınırsa
önce migration script'i (`godot --headless --editor --quit`) çalıştır.

---

## 2. Phaser 3.x Sürüm Uyumu

| Sürüm | Durum | Not |
|---|---|---|
| 3.50-3.55 | kararlı | eski API; `Phaser.Scale.FIT` mevcut |
| 3.60 | kararlı | WebGL renderer iyileştirme |
| 3.70-3.80 | kararlı (önerilen) | `this.add.graphics`, `generateTexture` olgun |
| 3.85+ | güncel | API geriye dönük uyumlu |

**Kural:** Phaser 3.x API'si büyük ölçüde kararlı. `3.80.1` CDN sürümü
tüm recipe'lerde kullanılır. 2.x ile uyumsuz (Scene config farklı).

---

## 3. Godot 4 vs Phaser 3 — Sistem Karşılaştırması

| Sistem | Godot 4 (daha kolay) | Phaser 3 (daha kolay) | Not |
|---|---|---|---|
| Karakter hareketi | CharacterBody2D | Arcade Physics | ikisi de kolay |
| Kamera | Camera2D (yerleşik) | camera.startFollow | Godot daha az kod |
| Input | InputMap (editor) | keyboard.createCursorKeys | Godot görsel, Phaser kod |
| Çarpışma | CollisionShape2D | physics.add.collider | ikisi de net |
| Save/Load | FileAccess + JSON | localStorage | Phaser web-native |
| Menü/UI | Control node'ları | Text/Rectangle | Godot node tabanlı |
| Düşman AI | GDScript state machine | JS class | eşit karmaşıklık |
| Spawn | Timer + PackedScene | time.addEvent + group | eşit |
| Object Pooling | Node dizisi + process_mode | group + maxSize | Phaser daha hazır |
| Hasar/Sağlık | Area2D overlap | physics overlap | eşit |
| Ses | AudioStreamPlayer | this.sound | Phaser web-native |
| Mobil kontrol | InputEventScreenTouch | pointer + Scale | eşit |
| Web build | Export preset (WASM) | Statik site (Vite) | Phaser daha hafif |
| Windows build | Native export | Electron gerekir | **Godot daha iyi** |

**Özet öneri (Technical Director için):**
- Web-first casual oyun → **Phaser 3** (hafif, native tarayıcı)
- Mobil + desktop + web tek kod → **Godot 4** (native export)
- 3D orta seviye → **Godot 4** (Phaser 3D yok)
- Hızlı prototip / deneme → **Phaser 3** (CDN ile anında)

---

## 4. Runtime Gereksinimleri

| Motor | Runtime | Not |
|---|---|---|
| Godot 4 | Export template (bir kez indir) | Editör ayrı; oyun çalıştırılabilir dosya üretir |
| Phaser 3 | Node.js + bundler (opsiyonel) | Tarayıcıda doğrudan; CDN ile runtime gerekmez |

---

## 5. Node / JS Runtime (Phaser için)

- Phaser 3: ES modül destekli tarayıcı (modern). IE desteklenmez.
- Vite/Webpack: Node 18+ önerilir.
- TypeScript: `phaser` tipleri resmî pakette mevcut.
