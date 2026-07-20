# Godot Top-Down Action Template

Godot 4.x (GDScript) ile minimal çalışan top-down (yukarıdan görünüm) aksiyon
şablonu: 8 yönlü hareket, basit düşman AI (kovala), hasar/sağlık ve ölüm.

## Özellikler
- Top-down hareket (yerçekimi yok)
- Düşman devriye + oyuncu algılama + kovala
- Area2D ile hasar alma + invincibility frame
- Sağlık (HP) sistemi

## Çalıştırma
Godot 4.x ile `project.godot` import et, `F5` ile oynat.

## Dosya Yapısı
```
godot_topdown_action/
├── project.godot
├── scenes/
│   ├── main.tscn
│   ├── player.tscn
│   └── enemy.tscn
└── scripts/
    ├── player_topdown.gd
    └── enemy.gd
```
