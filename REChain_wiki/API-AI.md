# AI API Reference

## Moderation
- **REST:** `POST /api/v1/ai/moderate`
- **gRPC:** `AIService.Moderate`
- **Auth:** Bearer token required

### Request
```json
{
  "text": "Some message to moderate"
}
```

### Response
```json
{
  "result": "clean",
  "score": 0.98
}
```

## Translation
- **REST:** `POST /api/v1/ai/translate`
- **gRPC:** `AIService.Translate`

### Request
```json
{
  "text": "Hello",
  "target_lang": "es"
}
```

### Response
```json
{
  "translated": "Hola"
}
```

## Summarization
- **REST:** `POST /api/v1/ai/summarize`
- **gRPC:** `AIService.Summarize`

### Request
```json
{
  "text": "Long text..."
}
```

### Response
```json
{
  "summary": "Short summary."
}
```

## Code Analysis
- **REST:** `POST /api/v1/ai/code/analyze`
- **gRPC:** `AIService.AnalyzeCode`

---

For more, see [AI Services Setup](../docs/AI_SERVICES_SETUP.md). 