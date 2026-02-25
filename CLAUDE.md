# Flutter Project

## Commands

| Command | Description |
|---------|-------------|
| `/feature <prompt>` | Plan a feature interactively |
| `/extract` | Save plan to `plan.md` |
| `/build @plan.md` | Implement from plan |
| `/test [path]` | Run tests |
| `/commit [message]` | Commit changes |
| `/fast <issue>` | Quick fix for any issue |
| `/build:fast @plan.md` | Build → Test → Commit (auto) |

## Workflow

### Standard Flow
1. `/feature create auth` → Plan
2. `/extract` → Save to `plan.md`
3. `/clear` → Release session
4. `/build @plan.md` → Implement
5. `/test` → Run tests
6. `/commit` → Commit changes

### Fast Flow
- `/build:fast @plan.md` → Build + Test + Commit (all-in-one)
- `/fast fix login button not working` → Quick fix + validate

## Dart MCP Server

Setup (requires Dart 3.9+):
```bash
claude mcp add --transport stdio dart -- dart mcp-server
```

Tools: `analyze_files`, `dart_fix`, `dart_format`, `pub`, `pub_dev_search`, `run_tests`

---

# AI Rules for Flutter

> Source: https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

You are an expert in Flutter and Dart development. Your goal is to build beautiful, performant, and maintainable applications following modern best practices.

## Interaction Guidelines

- Assume the user is familiar with programming concepts but may be new to Dart.
- When generating code, provide explanations for Dart-specific features like null safety, futures, and streams.
- If a request is ambiguous, ask for clarification on the intended functionality and the target platform.
- When suggesting new dependencies from `pub.dev`, explain their benefits.
- Use the `dart_format` tool to ensure consistent code formatting.
- Use the `dart_fix` tool to automatically fix common errors.
- Use the `analyze_files` tool to run the linter.

## Project Structure

Standard Flutter project structure with `lib/main.dart` as the primary entry point:

```
lib/
  main.dart
  app.dart
  core/                     # Shared utilities, extensions, constants
  features/
    <feature_name>/
      presentation/         # Widgets, screens, view models
      domain/               # Business logic, use cases
      data/                 # Models, repositories, API clients
  routing/                  # GoRouter configuration
  theme/                    # ThemeData, color schemes, text themes
test/
  unit/
  widget/
  integration/
```

## Flutter Style Guide

- **SOLID Principles**: Apply throughout the codebase.
- **Concise and Declarative**: Write concise, modern, technical Dart code. Prefer functional and declarative patterns.
- **Composition over Inheritance**: Favor composition for building complex widgets and logic.
- **Immutability**: Prefer immutable data structures. Widgets (especially `StatelessWidget`) should be immutable.
- **State Management**: Separate ephemeral state and app state.
- **Widgets are for UI**: Compose complex UIs from smaller, reusable widgets.
- **Navigation**: Use `go_router` for declarative navigation, deep linking, and web support.

## Package Management

- Use `pub` MCP tool to manage packages when available.
- Use `pub_dev_search` to find suitable packages.
- Fallback: `flutter pub add <package_name>` or `flutter pub add dev:<package_name>`
- To remove: `dart pub remove <package_name>`

## Code Quality

- **Naming**: `PascalCase` for classes, `camelCase` for members/variables, `snake_case` for files. Avoid abbreviations.
- **Line length**: 80 characters or fewer.
- **Conciseness**: Code should be as short as possible while remaining clear.
- **Simplicity**: Straightforward code over clever/obscure code.
- **Error Handling**: Anticipate and handle errors. Never fail silently.
- **Functions**: Short, single purpose (< 20 lines).
- **Logging**: Use `dart:developer` log instead of `print`.

## Dart Best Practices

- Follow [Effective Dart](https://dart.dev/effective-dart)
- **Null Safety**: Write soundly null-safe code. Avoid `!` unless guaranteed non-null.
- **Async/Await**: Use `Future`, `async`, `await` with robust error handling. Use `Stream` for sequences.
- **Pattern Matching**: Use where it simplifies code.
- **Records**: Use to return multiple values without defining a class.
- **Switch**: Prefer exhaustive `switch` expressions (no `break` needed).
- **Exceptions**: Use `try-catch` with appropriate exception types. Create custom exceptions.
- **Arrow Functions**: Use for simple one-line functions.

## Flutter Best Practices

- **Immutability**: Widgets (especially `StatelessWidget`) should be immutable.
- **Composition**: Prefer composing smaller widgets over extending. Avoid deep nesting.
- **Private Widgets**: Use small private `Widget` classes, not helper methods returning widgets.
- **Build Methods**: Break down large `build()` into smaller private widget classes.
- **Lazy Lists**: Use `ListView.builder` or `SliverList` for long lists.
- **Isolates**: Use `compute()` for expensive calculations (JSON parsing, etc.).
- **Const Constructors**: Use `const` in constructors and `build()` methods to reduce rebuilds.
- **No Expensive Ops in build()**: Never do network calls or heavy computation in `build()`.

## State Management

Prefer Flutter's built-in solutions. No third-party unless explicitly requested.

- **ValueNotifier + ValueListenableBuilder**: Simple local state (single value)
  ```dart
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueListenableBuilder<int>(
    valueListenable: _counter,
    builder: (context, value, child) => Text('Count: $value'),
  );
  ```

- **ChangeNotifier + ListenableBuilder**: Complex or shared state
- **Stream + StreamBuilder**: Sequence of async events
- **Future + FutureBuilder**: Single async operation
- **MVVM**: When robust architecture needed, with manual constructor DI

## Navigation (GoRouter)

```dart
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) => DetailScreen(id: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
);

MaterialApp.router(routerConfig: router);
```

Use built-in `Navigator` only for short-lived screens (dialogs, temporary views).

## Data & Serialization

Use `json_serializable` + `json_annotation`:

```dart
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String firstName;
  final String lastName;
  User({required this.firstName, required this.lastName});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

Run after modifying: `dart run build_runner build --delete-conflicting-outputs`

## Theming

- Use `ColorScheme.fromSeed()` for harmonious palettes
- Define both `theme` and `darkTheme` in `MaterialApp`
- Use `Theme.of(context).textTheme` and `Theme.of(context).colorScheme`
- Custom tokens via `ThemeExtension<T>`

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
  ),
  darkTheme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
  ),
);
```

## Lint Rules

```yaml
include: package:flutter_lints/flutter.yaml
linter:
  rules: {}
```

## Testing

- **Unit**: `package:test` for domain, data, state
- **Widget**: `package:flutter_test` for UI
- **Integration**: `package:integration_test` for e2e
- **Assertions**: Prefer `package:checks` over matchers
- **Pattern**: Arrange-Act-Assert (Given-When-Then)
- **Mocks**: Prefer fakes/stubs. Use `mockito`/`mocktail` only if necessary.

## Documentation

- `///` doc comments for all public APIs
- Start with single-sentence summary
- Explain *why*, not *what*
- Use backticks for code references

## Accessibility

- Color contrast: 4.5:1 minimum
- Test with dynamic text scaling
- Use `Semantics` widget for labels
- Test with TalkBack/VoiceOver
