# Codegen Görev Şablonu

Kod üretim görevleri (gameplay mekanikleri, sistemler, AI, ekonomi) için.
`recipes/` kullanır, `validation` adımlarıyla doğrular.

```yaml
task_id: CODE-<no>
task_type: codegen
title: <sistem adı, örn "Player Movement">
assigned_to: gameplay_programmer
priority: P1

brief: |
  <motor> ile <sistem> uygula. <bağlam: hangi template üzerine?>

inputs:
  - recipes/<motor>/<sistem>.yaml      # TARİF — buradan kod üret
  - templates/game-templates/<motor>_<tip>/  # hedef template
  - project.yaml (motor/dil/sürüm)

tools_required:
  - file_read / file_write / edit_file
  - <motor>_cli (build/run)
  - project_test (teknik test)

constraints:
  engine: <godot|phaser>
  language: <gdscript|javascript>
  engine_version: <4.x|3.x>   # version-compatibility'den
  code_standard: <prototip|production>  # aşamaya göre

recipe_ref: recipes/<motor>/<sistem>.yaml
validation:                  # recipe'deki validation maddelerinin kopyası
  - movement_works
  - diagonal_speed_normalized
  - collision_works

approval_required: false     # prototip aşamasında genelde false

expected_output:
  - "<sistem>.gd/.js dosyası>"
  - "build/test geçiyor"
  - "kısa açıklama (ne değişti)"

on_fail:
  - retry: 2
  - escalate_to: technical_director
```

## Codegen Kuralları (Technical Director standartı)
- **Recipe kullan:** Rastgele kod yazma; `recipes/` tarifini uygula.
- **Sürüm kilidi:** `version-compatibility/matrix.md` ve `engine-profiles/`'a uy.
- **Bilinen hatalar:** `known-errors/<motor>.md` kontrol et, çözümü uygula.
- **Validation:** Her çıktı recipe'deki `validation` maddelerini geçmeli.
- **Checkpoint:** Başarısız test → ana dala alınmaz.
