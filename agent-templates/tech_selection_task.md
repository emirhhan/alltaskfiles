# Tech-Selection Görev Şablonu

Motor/dil/framework seçimi görevi. **Fusion council akışını** tetikler
(aday → hakem → sentez). Game Director tarafından `call_technical_director`
aracıyla başlatılır.

```yaml
task_id: TECH-<no>
task_type: tech-selection
title: "Motor/Dil Seçimi"
assigned_to: technical_director
priority: P0

brief: |
  <kullanıcı fikri> + <hedef platformlar> + <kapsam>
  örn: "Denizaltında top-down 2D roguelite, 15 dk, Web+Steam"

inputs:
  - user_brief (Game Director'dan)
  - engine-profiles/godot.yaml
  - engine-profiles/phaser.yaml
  - version-compatibility/matrix.md (Godot vs Phaser karşılaştırması)
  - recipes/ (her iki motor için sistem kapsamı)

tools_required:
  - call_technical_director   # council akışını tetikler
  - fusion_engine.run (task_type=tech-selection)

constraints:
  approved_engines: [godot, phaser]   # config.yaml game.approved_engines
  license_policy: strict

# Council akışı için prompt yer tutucuları
judge_prompt_ref: fusion/judge_prompt.txt     # tech-selection kriterleri
synth_prompt_ref: fusion/synth_prompt.txt    # "öneri + risk + onay sorusu" formatı

validation:
  - candidate_models_compared   # en az 2 aday (Godot vs Phaser)
  - judge_scored               # hakem puanladı
  - synthesized                # sentez gerekçeli öneri üretti
  - user_approval_question_present  # onay sorusu var mı?

approval_required: true        # kullanıcı onayı ZORUNLU (technology-locked)

expected_output:
  - "Önerilen motor + dil"
  - "Gerekçe (madde madde)"
  - "Riskler + çözüm"
  - "Kullanıcı onay sorusu"

on_success:
  - create_checkpoint: technology-locked
  - record_decision: <Decision>  # fusion_result_ref + chosen + approved_by_user
  - lock_engine_version: <sürüm>  # version-compatibility'den

on_fail:
  - retry: 1 (farklı temperature)
  - escalate_to: game_director (kullanıcıya rapor)
```

## Council Akışı (Bölüm A3.1)
```
brief → _order_candidates() → N aday PARALEL (farklı temp) →
straggler kesme → HAKEM + SENTEZ paralel →
FusionResult.reason → kullanıcıya "gerekçeli öneri" →
KULLANICI ONAYI → Decision kaydı + technology-locked checkpoint
```

## Değerlendirme Kriterleri (judge_prompt'a enjekte)
2D/3D ihtiyacı, hedef platform, mobil performans, web export, geliştirme hızı,
build karmaşıklığı, lisans, uzun vadeli bakım, asset pipeline uyumu, AI otomasyon kolaylığı.
