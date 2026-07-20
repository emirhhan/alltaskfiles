# Phaser 2D Platformer Template

Phaser 3 (JavaScript) ile minimal çalışan 2D platformer başlangıç şablonu.
CDN üzerinden Phaser yüklenir; build aracı gerekmez.

## Özellikler
- Arcade physics hareket + zıplama
- Zemin ile collider çarpışması
- Kamera takip
- Klavye girişi

## Çalıştırma
```bash
cd templates/game-templates/phaser_2d_platformer
python -m http.server 8080
# tarayıcıda http://localhost:8080 aç
```
Veya: `npx serve .`

## Dosya Yapısı
```
phaser_2d_platformer/
├── index.html
└── src/
    ├── main.js          # Phaser.Game config
    └── scenes/
        ├── BootScene.js
        └── GameScene.js
```

## Notlar
- `main.js` içinde `parent: 'game'` ile index.html'deki `<div id="game">`'e bağlanır.
- Daha fazla sistem için `recipes/phaser/` klasörüne bak.
