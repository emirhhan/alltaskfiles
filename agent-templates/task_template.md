# Agent Görev Şablonu (Generic)

Her agent görevinde kullanılacak standart şablon. `task_model_map` ve
`TASK_TYPES` ile eşlenir (Bölüm A5).

```yaml
task_id: <benzersiz-id>
task_type: <concept|tech-selection|gdd|codegen|asset-gen|qa-test|build-release>
title: <kısa başlık>
assigned_to: <agent-rol>   # game_director | technical_director | uzman
priority: <P0|P1|P2>

brief: |
  <görev açıklaması — ne yapılacağı, bağlam, kısıtlar>

inputs:
  - <gerekli kaynak/referans, örn recipes/godot/character_movement.yaml>
  - <kullanıcı brief'i, proje manifesti>

tools_required:
  - <araç adı, örn call_technical_director>
  - <dosya oku/yaz, motor CLI, test>

constraints:
  - engine: <godot|phaser>
  - platform: <web|windows|android|ios>
  - permission_mode: <safe|balanced|autonomous>

validation:
  - <doğrulama kriteri 1>
  - <doğrulama kriteri 2>

approval_required: <true|false>   # mutating/is_dangerous araçlar için

expected_output:
  - <beklenen çıktı 1>
  - <beklenen çıktı 2>

on_fail:
  - retry: <adım sayısı>
  - escalate_to: <agent-rol>
```

## Kullanım Notları
- `task_type` → `config.yaml: task_model_map` ile öncelikli modele eşlenir.
- `approval_required: true` ise CLI onay kapısı devreye girer.
- `validation` maddeleri otomatik test/checklist olarak kullanılır.
- Görev bittiğinde `Decision` kaydı (onaylıysa) proje hafızasına yazılır.
