# Phaser 3 — Bilinen Hatalar ve Çözümler

> Kayıt formatı: **Hata** / **Belirti** / **Çözüm** / **Kaynak**
> Güven puanı (1-5): 5 = resmî docs, 4 = doğrulanmış topluluk, 3 = deneysel.

---

## PHASER-001: physics body undefined (null)
- **Hata:** `sprite.body` erişiminde "Cannot read property 'body' of undefined".
- **Belirti:** `this.physics.add.sprite()` çağrılmadan önce body'ye erişilmeye çalışılır.
- **Çözüm:** Sprite'ı `this.physics.add.sprite()` ile oluştur; saf `this.add.sprite()`
  fizik gövdesi vermez. Group kullanıyorsan `group.create()` ile al.
- **Kaynak:** docs.phaser.io (Arcade Physics) — güven 5

## PHASER-002: scene restart memory leak
- **Hata:** Sahne tekrar başlatılınca bellek artar, performans düşer.
- **Belirti:** Her restart'ta FPS azalır; event listener'lar çoğalır.
- **Çözüm:** `shutdown` event'inde (`this.events.on('shutdown', ...)`) timer'ları
  (`time.removeAllEvents()`) ve listener'ları temizle. `this.input.off()` çağır.
- **Kaynak:** Phaser forum (best practices) — güven 4

## PHASER-003: audio context resume on mobile
- **Hata:** Mobil tarayıcıda ses ilk başta çalmıyor.
- **Belirti:** `this.sound.play()` sessiz; tıklamadan sonra düzelir.
- **Çözüm:** Tarayıcı autoplay politikası: ilk kullanıcı etkileşiminde
  (`this.input.once('pointerdown', ...)`) sesi başlat. `this.sound.unlock()`
  (eski sürüm) veya manuel play.
- **Kaynak:** docs.phaser.io (SoundManager) — güven 5

## PHASER-004: scale manager config yanlış
- **Hata:** Oyun farklı ekranlarda bozuk görünür / siyah kenar.
- **Belirti:** Canvas tam ekranı doldurmaz veya taşar.
- **Çözüm:** `scale: { mode: Phaser.Scale.FIT, autoCenter: CENTER_BOTH, width, height }`
  kullan. RESIZE modu daha esnek ama responsive kod gerektirir.
- **Kaynak:** docs.phaser.io (ScaleManager) — güven 5

## PHASER-005: WebGL context lost
- **Hata:** Sekme arka plana alınınca "WebGL context lost" hatası.
- **Belirti:** Oyun donar, siyah ekran.
- **Çözüm:** `this.game.events.on('contextlost'/'contextrestored')` ile kaynakları
  yeniden yükle. Veya `disableContextMenu` + otomatik pause (`pauseOnBlur: true`).
- **Kaynak:** Phaser GitHub issues — güven 4

## PHASER-006: CORS asset yükleme hatası
- **Hata:** `Failed to load resource: CORS policy` (farklı domain'den asset).
- **Belirti:** Resim/ses yüklenmez; konsolda CORS hatası.
- **Çözüm:** Asset'leri aynı origin'de (veya CDN CORS başlıklı) tut. Geliştirme
  sırasında `python -m http.server` ile local serve et (file:// CORS tetikler).
- **Kaynak:** Phaser docs (Loader) — güven 5

## PHASER-007: group.get() null dönüyor
- **Hata:** Object pool dolunca `get()` undefined/null verir, spawn başarısız.
- **Belirti:** `Cannot read property 'setActive' of null`.
- **Çözüm:** `maxSize` dolunca `get()` null döner; spawn öncesi null kontrolü yap
  (`if (!obj) return;`). Havuz boyutunu gerçek ihtiyaç + %20 tampon yap.
- **Kaynak:** docs.phaser.io (Group) — güven 5
