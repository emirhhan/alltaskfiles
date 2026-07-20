# Director Dispatch — Game Director → Technical Director

Game Director'ın Technical Director'ı bir **araç (tool)** olarak nasıl çağıracağı.
Skeleton'ın `Tool` sözleşmesi değişmeden, bir agent'ın kendisi başka bir
agent loop'unu tetikleyen bir araç olarak `tools.py`'ye kaydedilir.

## Araç Tanımı (tools.py'ye eklenecek)

```python
TOOL_call_technical_director = Tool(
    name="call_technical_director",
    description="Game Director'dan teknik karar brief'i alır, "
                "Technical Director'ı (council akışıyla) tetikler, "
                "gerekçeli öneri döndürür.",
    schema={
        "type": "object",
        "properties": {
            "brief": {
                "type": "string",
                "description": "Kullanıcı fikri + kapsam + hedef platform "
                                "(örn. 'top-down 2D roguelite, Web+Steam')"
            },
            "decision_type": {
                "type": "string",
                "enum": ["tech-selection", "architecture", "performance", "build"],
                "description": "Hangi teknik karar isteniyor"
            }
        },
        "required": ["brief", "decision_type"]
    },
    executor=dispatch_technical_director,
    mutating=False,        # sadece analiz/sorgu
    is_dangerous=False
)
```

## Executor (örnek akış)

```python
async def dispatch_technical_director(brief: str, decision_type: str) -> str:
    # 1. Technical Director agent loop'unu başlat (SYSTEM_PROMPT: skills/technical_director.md)
    td = AgentLoop(system_prompt=load_skill("technical_director"))
    # 2. Council akışını tetikle (engine.run)
    result = await fusion_engine.run(
        task=brief,
        task_type=decision_type,   # tech-selection / architecture / ...
    )
    # 3. Gerekçeli öneriyi döndür (Game Director'a iletilir)
    return result.final_answer   # sentez çıktısı (öneri + risk + onay sorusu)
```

## Agent-Arası Mesajlaşma Formatı

```yaml
from: game_director
to: technical_director
type: tech-selection
brief: "Denizaltında top-down 2D roguelite, 15 dk, Web+Steam"
context:
  target_platforms: [web, steam-win]
  scope: mvp
expected_output:
  - recommended_engine
  - recommended_language
  - rationale (madde madde)
  - risks
  - user_approval_required: true
```

## Notlar
- Game Director **asla** motor kararını kendisi vermez; bu araçla TD'ya yönlendirir.
- TD'nin council çıktısı kullanıcıya "gerekçeli öneri" olarak sunulur,
  **onay alınmadan kilitlemez** (onay kapısı Game Director'da).
- Hata çözme sırası (skills/technical_director.md): aynı agent → alternatif →
  farklı model → başka agent → TD → kullanıcı raporu.
