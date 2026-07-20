# Phaser 2D Platformer Template

Phaser 3 (JavaScript, ES Modules) ile minimal çalışan 2D platformer başlangıç şablonu.
Phaser NPM paketi üzerinden import edilir; Vite ile build alınır (CDN kullanılmaz).

## Özellikler
- Arcade physics hareket + zıplama
- Zemin ile collider çarpışması
- Kamera takip
- Klavye girişi

## Çalıştırma
```bash
cd templates/game-templates/phaser_2d_platformer
npm install
npm run dev      # geliştirme sunucusu (http://localhost:5173)
# veya
npm run build    # production build -> dist/
npm run preview  # build çıktısını önizle
```

## Dosya Yapısı
```
phaser_2d_platformer/
├── package.json
├── vite.config.js
├── index.html
└── src/
    ├── main.js          # Phaser.Game config
    └── scenes/
        ├── BootScene.js
        └── GameScene.js
```

## Notlar
- `main.js` içinde `import Phaser from 'phaser'` ile NPM paketinden yüklenir.
- `parent: 'game'` ile index.html'deki `<div id="game">`'e bağlanır.
- Daha fazla sistem için `recipes/phaser/` klasörüne bak.
