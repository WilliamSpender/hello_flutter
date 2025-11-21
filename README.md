# Sandwich Shop — Flutter App

Small, cross-platform Flutter app for browsing, customizing, and ordering sandwiches.

File: `README.md`

## Table of contents
- [About](#about)
- [Features](#features)
- [Tech stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
- [Run & build](#run--build)
- [Project structure](#project-structure)
- [State & architecture](#state--architecture)
- [Assets and localization](#assets-and-localization)
- [Testing](#testing)
- [CI / CD](#ci--cd)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## About
Sandwich Shop is a Flutter-based mobile app that lets users browse a menu of sandwiches, view details, customize ingredients and sizes, add items to a cart, and place orders. The app targets Android and iOS and includes a responsive UI suitable for tablets.

## Features
- Menu list with categories and search
- Sandwich detail views with customization (ingredients, extras, size)
- Cart management and order preview
- Simple local persistence for cart and favorites
- Network-ready service layer for menu and orders
- Basic analytics / logging hooks

## Tech stack
- Flutter / Dart
- Native Android tooling (Kotlin / Gradle)
- Native iOS tooling (Swift/Obj-C via Flutter)
- Optional native modules (C++ via platform channels)
- Package management: `pub` / `flutter pub`

## Prerequisites
- Flutter SDK (stable channel) — recommended stable version matching `environment` in `pubspec.yaml`
- Android SDK (for Android builds)
- Xcode (for iOS builds on macOS)
- Linux toolchain if building native plugins
- Java / Gradle installed for Android builds

## Getting started
1. Clone repository:
2. Install dependencies:
3. Inspect and update `pubspec.yaml` and `android/`, `ios/` configs as needed.

## Run & build
- Run on connected device or emulator:
- Run a specific device:
- Build APK:
- Build Android app bundle:
- Build iOS (on macOS):
- Run tests:

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

Refer to actual repository files: `lib/`, `pubspec.yaml`, `android/`, `ios/`.

## State & architecture
- Use a single source of truth for cart and menu data (Provider / Riverpod / Bloc recommended).
- Keep UI pure and push business logic into services/providers.
- Abstract network calls through a `MenuService` and persist cart via a `StorageService` (local DB or `shared_preferences`).

## Assets and localization
- Add images and fonts under `assets/` and declare them in `pubspec.yaml` under `flutter.assets` and `flutter.fonts`.
- For localization, use Flutter Intl or `flutter_localizations` and place ARB files under `assets/i18n/` or `lib/l10n/`.

## Testing
- Unit tests in `test/` for models and services:
- Widget tests for screens and components:
- Mock network calls with `mockito` or `http_mock_adapter`.

## CI / CD
- Example: GitHub Actions or Bitrise to run `flutter analyze`, `flutter test`, and build artifacts.
- Cache `~/.pub-cache` and Flutter SDK for faster builds.

## Contributing
- Create a feature branch from `main`.
- Follow existing code style and run `flutter format`.
- Add tests for new logic.
- Open a pull request with a clear description.

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