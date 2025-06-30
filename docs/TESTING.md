# Testing & CI

## Running Tests
- Dart: `flutter test`
- Python: `pytest bridges/telegram_super_tma/test_bot.py`
- E2E: `python bridges/telegram_super_tma/test_e2e.py` (dashboard), `test_e2e_rbac.py` (RBAC UI)

## CI/CD
- See `.github/workflows/` for automated pipelines
- Tests run on every push and PR
- E2E tests use Selenium/Chrome in CI

## Extending
- Add new tests for features, plugins, and APIs
- Use mocks for Telegram/Matrix events
- Add E2E tests for new UIs and widgets

--- 