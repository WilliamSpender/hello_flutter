# Sandwich Shop — Flutter App

File: `README.md`

## About
Sandwich Shop is a Flutter-based  app that lets users create and customize ingredients, sizes and more for a sandwich order.

## Features
- Sandwich detail views with customization (ingredients, extras, size)

## Getting started
1. Clone repository via link: `https://github.com/WilliamSpender/hello_flutter.git`

## Dependencies:
This program requires a flutter SDK and dart

## Project structure
Typical layout (adjust to actual project layout):

- `lib/` — application code
  - `lib/main.dart` — app entrypoint
  - `lib/models/` — data models (e.g., `sandwich.dart`, `order.dart`)
  - `lib/services/` — API, persistence, and platform channels
  - `lib/providers/` or `lib/blocs/` — state management layer
  - `lib/ui/` or `lib/screens/` — screens and navigation
  - `lib/widgets/` — reusable UI components
- `assets/` — images, fonts
- `android/`, `ios/` — platform-specific code
- `test/` — unit and widget tests
- `pubspec.yaml` — dependencies and assets

## Testing
- Use Flutter test ...

## Troubleshooting
- If builds fail on Android, ensure Android SDK and platform-tools are installed and `ANDROID_HOME` is set.
- If iOS build fails, run `pod install` in `ios/` and open workspace in Xcode for signing issues.
- Use `flutter doctor -v` to debug environment problems.

## Useful commands
- `flutter pub get` — fetch deps
- `flutter analyze` — static analysis
- `flutter format .` — format code
- `flutter clean` — clear build artifacts
- `flutter devices` — list devices

---