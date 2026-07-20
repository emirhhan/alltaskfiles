# Agent Templates — İndeks

Bu klasör agent görev şablonlarını ve director dispatch yapısını tutar.

| Dosya | İçerik | Kullanım |
|---|---|---|
| `task_template.md` | Genel agent görev şablonu (YAML) | Tüm görevler için temel iskelet |
| `codegen_task.md` | Kod üretim görevi | Gameplay/sistem/AI kodu (recipe kullanır) |
| `tech_selection_task.md` | Teknoloji seçimi görevi | Council akışı tetikler, onay kapısı |
| `director_dispatch.md` | Game Director → Technical Director çağrısı | `call_technical_director` araç tanımı + mesaj formatı |

## Görev Türü → Şablon Eşlemesi (Bölüm A5)
| `task_type` | Şablon |
|---|---|
| `concept` | task_template |
| `tech-selection` | tech_selection_task |
| `gdd` | task_template |
| `codegen` | codegen_task |
| `asset-gen` | task_template (harici servis) |
| `qa-test` | task_template (test araçları) |
| `build-release` | task_template (build araçları) |

## Kullanım
- Yeni görev açılırken uygun şablonu kopyala, `task_id`/`brief`/`inputs` doldur.
- `task_type` → `config.yaml: task_model_map` ile öncelikli modele eşlenir.
- `approval_required: true` → CLI onay kapısı.
- Görev bittiğinde `Decision` + checkpoint proje hafızasına yazılır.
