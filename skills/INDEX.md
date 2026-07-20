# Skills — İndeks

Bu klasör Fusion Game agent'larının kimlik ve çalışma yöntemi dosyalarını tutar.
Her skill, `fusion_game_birlesik_mimari_ve_uygulama_plani.md` Bölüm 6'daki
agent mimarisine karşılık gelir.

| Dosya | Rol | Sorumlu olduğu | Tetikleyen |
|---|---|---|---|
| `game_director.md` | Game Director | Kullanıcı iletişimi, vizyon, kapsam, onay kapıları | Kullanıcı fikri / proje başlangıcı |
| `technical_director.md` | Technical Director | Motor seçimi, mimari, kod standardı, performans, build | Game Director'dan tech-selection brief'i |

## Hiyerarşi
```
Kullanıcı
   └─ Game Director (ana iletişim)
         └─ Technical Director (teknik karar, council tetikler)
               └─ Uzman agent'lar (ihtiyaç anında)
```

## Kullanım
- Her agent `loop.py` döngüsünün bir örneği; kendi SYSTEM_PROMPT'u bu dosyadan yüklenir.
- Game Director, Technical Director'ı `call_technical_director` aracıyla çağırır
  (bkz. `agent-templates/director_dispatch.md`).
- Yeni uzman agent eklenecekse buraya yeni bir `<rol>.md` ekle.
