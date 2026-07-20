# Godot — Resmî Kaynaklar

> Kaynak güven puanı (1-5) ve öncelik. Fusion Game bilgi tabanına kayıt için.

| # | Kaynak | URL | Güven | Öncelik | Kullanım |
|---|---|---|---|---|---|
| 1 | Resmî Dokümantasyon | https://docs.godotengine.org | 5 | Birincil | API ref, tutorial, sürüm notları |
| 2 | GitHub Repo | https://github.com/godotengine/godot | 5 | Birincil | Kaynak kod, issue, PR |
| 3 | Godot Asset Library | https://godotengine.org/asset-library/asset | 4 | Doğrulanmış | Topluluk eklentileri, araçlar |
| 4 | Godot Forum | https://forum.godotengine.org | 4 | Topluluk | Soru-cevap, çözüm |
| 5 | Godot Engine Docs (TR) | https://docs.godotengine.org/tr/ | 4 | Birincil (TR) | Türkçe doküman |
| 6 | Godot YouTube (resmî) | https://youtube.com/c/GodotEngine | 4 | Eğitim | Video tutorial |
| 7 | Reddit r/godot | https://reddit.com/r/godot | 3 | Topluluk | Deneyim, örnek |
| 8 | Getting Started (İlk 2D/3D Oyun) | https://docs.godotengine.org/en/stable/getting_started/ | 5 | Birincil | Adım adım resmî tutorial |

## Temel Kullanım Rehberleri
- **İlk 2D oyun**: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html
- **İlk 3D oyun**: https://docs.godotengine.org/en/stable/getting_started/first_3d_game/index.html
- **Çekirdek kavramlar (Sahne/Düğüm/Sinyal)**: https://docs.godotengine.org/en/stable/getting_started/step_by_step/index.html

## Kaynak Güven Politikası (Bölüm 7'ye uygun)
1. Resmî/birincil (docs, GitHub) → seed ders olarak kullanılır
2. Doğrulanmış açık kaynak (asset library onaylı) → recipe kaynağı
3. Güvenilir eğitim (resmî YouTube) → örnek kod
4. Topluluk (forum, Reddit) → doğrulama gerekir
5. Deneysel → yalnızca işaretli deneysel recipe

## Recipe Bağlantıları
- `recipes/godot/*.yaml` → her biri `official_source` alanında docs URL'si taşır
- `known-errors/godot.md` → çözümler docs'a atıflı
