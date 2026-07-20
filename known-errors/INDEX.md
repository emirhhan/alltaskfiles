# Known-Errors — İndeks

Bu klasör, Godot 4 ve Phaser 3 için bilinen hataları ve çözümlerini tutar.
Her kayıt `known-errors/<motor>.md` içinde HATA/BELİRTİ/ÇÖZÜM/KAYNAK formatındadır.

| Dosya | İçerik | Kayıt sayısı |
|---|---|---|
| `godot.md` | Godot 4 bilinen hataları | 7 (GODOT-001..007) |
| `phaser.md` | Phaser 3 bilinen hataları | 7 (PHASER-001..007) |

## Kullanım
- Bir hata ile karşılaşıldığında önce buraya bak.
- Recipe sistemine bağlama: her recipe'in `notes` alanı ilgili hataya atıfta bulunabilir.
- Yeni hata bulununca `<MOTOR>-NNN` koduyla ekle, güven puanını belirt.

## Güven puanı
- 5 = Resmî dokümantasyon
- 4 = Doğrulanmış topluluk / GitHub issues
- 3 = Deneysel / tekil gözlem
