# FST POS - Project Documentation

This documentation is optimized for AI agent prompting and development assistance.

## Quick Reference

| Aspect | Technology |
|--------|------------|
| State Management | Riverpod + riverpod_generator |
| Routing | GoRouter + go_router_builder |
| UI Components | shadcn_flutter + flutter_side_menu |
| HTTP Client | Dio with interceptors |
| Local Database | Drift (SQLite) |
| Secure Storage | flutter_secure_storage |
| Code Generation | freezed, json_serializable |
| Environment | flutter_dotenv |

## Documentation Index

- [ARCHITECTURE.md](./ARCHITECTURE.md) - Clean architecture structure and patterns
- [CONVENTIONS.md](./CONVENTIONS.md) - Code conventions and naming standards
- [FEATURES.md](./FEATURES.md) - Feature development guide with templates
- [API.md](./API.md) - API integration patterns and error handling
- [DATABASE.md](./DATABASE.md) - Drift database and offline sync patterns
- [STATE.md](./STATE.md) - Riverpod state management patterns

## Agent Prompting Guidelines

When working with this codebase, consider:

1. **Always check existing patterns** before implementing new features
2. **Follow clean architecture** - data → domain → presentation layers
3. **Use code generation** - run `dart run build_runner build` after adding models
4. **Handle errors consistently** - use Failure types from `core/errors/`
5. **Keep state in providers** - use riverpod_generator for type-safe providers

## Quick Commands

```bash
# Install dependencies
flutter pub get

# Generate code (freezed, drift, riverpod)
dart run build_runner build --delete-conflicting-outputs

# Watch for changes (development)
dart run build_runner watch --delete-conflicting-outputs

# Run on Android
flutter run -d android

# Run on Web (Chrome)
flutter run -d chrome

# Build for production
flutter build apk --release
flutter build web --release
```
