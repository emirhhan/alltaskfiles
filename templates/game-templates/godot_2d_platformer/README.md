# Godot 2D Platformer Template

Godot 4.x (GDScript) ile minimal çalışan 2D platformer başlangıç şablonu.

## Özellikler
- CharacterBody2D ile yatay hareket + zıplama
- Yerçekimi ve çapraz hız normalizasyonu
- Camera2D takip
- StaticBody2D zemin/engel çarpışması
- Input Map aksiyonları (move_left/right, jump)

## Gereksinimler
- Godot Engine 4.x (https://godotengine.org)
- Export templates (Editor > Manage Export Templates)

## Çalıştırma
1. Godot 4.x'i aç
2. `Project > Import` ile bu klasördeki `project.godot` seç
3. `F5` ile oynat

## Dosya Yapısı
```
godot_2d_platformer/
├── project.godot
├── scenes/
│   ├── main.tscn          # kök sahne (world + player + camera)
│   └── player.tscn       # karakter sahnesi
└── scripts/
    └── player.gd         # hareket + zıplama + kamera
```

## İpuçları
- Zıplama için `ui_accept` aksiyonuna Space/Spacebar eşlidir (project.godot'da).
- Yeni zemin eklemek için StaticBody2D + CollisionShape2D kullan.
- Daha fazla sistem için `recipes/godot/` klasörüne bak.
