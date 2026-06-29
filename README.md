# Petly

Petly is a local-first Flutter application for securely managing pet health,
care, documents, reminders, growth, and expenses on Android and iOS.

## Current implementation

- Flutter 3.44 / Dart 3.12 project scaffold
- Material 3 light and dark themes
- Riverpod dependency injection and reactive state
- Drift SQLite schema for all planned modules
- Owner onboarding stored locally
- Pet creation, editing, listing, details, and archival
- Five-tab responsive application shell

The full technical design lives in
[`docs/phase-1-design.md`](docs/phase-1-design.md).

## Development

```shell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```
