# Godot 4 — Bilinen Hatalar ve Çözümler

> Kayıt formatı: **Hata** / **Belirti** / **Çözüm** / **Kaynak**
> Güven puanı (1-5): 5 = resmî docs, 4 = doğrulanmış topluluk, 3 = deneysel.

---

## GODOT-001: Web export'ta ses çalmıyor
- **Hata:** Tarayıcıda ilk yüklemede ses sessiz.
- **Belirti:** `AudioStreamPlayer.play()` çağrılır ama ses yok.
- **Çözüm:** Tarayıcı autoplay politikası nedeniyle ses ilk kullanıcı etkileşimi
  (tık/dokunma) sonrası çalar. Bir "Start" butonu sonrası `play()` çağır.
- **Kaynak:** docs.godotengine.org (AudioServer) — güven 5

## GODOT-002: TileMap yerine TileMapLayer (4.3+)
- **Hata:** Eski `TileMap` node'u 4.3+ ile önerilmiyor.
- **Belirti:** TileSet ataması beklenen gibi çalışmıyor.
- **Çözüm:** 4.3+ ile `TileMapLayer` node'unu kullan; TileSet'i ayrı bir
  `TileSet` resource'u olarak oluştur.
- **Kaynak:** Godot 4.3 sürüm notları — güven 5

## GODOT-003: C# vs GDScript export boyutu
- **Hata:** C# kullanınca export boyutu ve süresi artar.
- **Belirti:** Windows/Linux export'ta .NET runtime eklenir.
- **Çözüm:** Protokol için GDScript yeterli; C# yalnızca karmaşık mantıkta kullan.
  Export template'leri .NET destekli sürümle indir.
- **Kaynak:** Godot docs (C# basics) — güven 5

## GODOT-004: Android export keystore hatası
- **Hata:** Android export'ta "keystore not found" veya imzalama hatası.
- **Belirti:** Export penceresi kırmızı uyarı verir.
- **Çözüm:** `keytool` ile bir release keystore oluştur; Export > Android sekmesinde
  yol/parola gir. Debug keystore otomatik üretilir (ilk export'ta).
- **Kaynak:** Godot docs (Exporting to Android) — güven 5

## GODOT-005: WebRTC / multiplayer web sınırlaması
- **Hata:** Web export'ta bazı ağ özellikleri çalışmaz.
- **Belirti:** WebSocket dışı protokoller engellenebilir.
- **Çözüm:** Web için yalnızca WebSocket (ws://) kullan; WebRTC sınırlı destekli.
- **Kaynak:** Godot docs (Networking) — güven 4

## GODOT-006: move_and_slide çarpışma çözülmüyor
- **Hata:** Karakter zemine düşmüyor / duvardan geçiyor.
- **Belirti:** `is_on_floor()` her zaman false.
- **Çözüm:** CollisionShape2D'nin `shape` özelliğinin atanmış olduğundan emin ol;
  `move_and_slide()` her `_physics_process` frame'inde çağrılmalı.
- **Kaynak:** Godot docs (CharacterBody2D) — güven 5

## GODOT-007: _process yerine _physics_process
- **Hata:** Fizik tabanlı hareket titrer / tutarsız.
- **Belirti:** Karakter bazen takılı kalır.
- **Çözüm:** Hareket/fizik kodunu `_physics_process(delta)` içine yaz;
  `_process` yalnızca UI/render için.
- **Kaynak:** Godot best practices — güven 5
