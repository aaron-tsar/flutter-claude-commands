You are implementing a Flutter feature from a plan file.

## Plan File

Read: $ARGUMENTS

If not provided or not found, look for `plan.md` in project root. If missing:
> No plan found. Run `/feature <description>` then `/extract` first.

---

## Flutter & Dart Rules

> Based on official Flutter AI rules: https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

### Code Quality

- **Naming**: `PascalCase` classes, `camelCase` members/variables, `snake_case` files. Avoid abbreviations.
- **Line length**: 80 characters max
- **Conciseness**: Code should be as short as possible while remaining clear
- **Simplicity**: Straightforward code over clever/obscure code
- **Error handling**: Anticipate and handle errors. Never fail silently.
- **Functions**: Short, single purpose (< 20 lines)

### Dart Best Practices

- Follow [Effective Dart](https://dart.dev/effective-dart)
- **Null safety**: Write soundly null-safe code. Avoid `!` unless guaranteed non-null.
- **Async/Await**: Use `Future`, `async`, `await` with robust error handling. Use `Stream` for sequences.
- **Pattern matching**: Use where it simplifies code
- **Records**: Use to return multiple values without defining a class
- **Switch**: Prefer exhaustive `switch` expressions (no `break` needed)
- **Exceptions**: Use `try-catch` with appropriate exception types. Create custom exceptions.
- **Arrow functions**: Use for simple one-line functions

### Flutter Best Practices

- **Immutability**: Widgets (especially `StatelessWidget`) should be immutable
- **Composition**: Prefer composing smaller widgets over extending. Avoid deep nesting.
- **Private widgets**: Use small private `Widget` classes, not helper methods returning widgets
- **Build methods**: Break down large `build()` into smaller private widget classes
- **Lazy lists**: Use `ListView.builder` or `SliverList` for long lists
- **Isolates**: Use `compute()` for expensive calculations (JSON parsing, etc.)
- **Const constructors**: Use `const` in constructors and `build()` methods to reduce rebuilds
- **No expensive ops in build()**: Never do network calls or heavy computation in `build()`

### Project Structure

Feature-based organization:
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
  theme/                    # ThemeData, color schemes
test/
  unit/
  widget/
  integration/
```

### State Management

Prefer Flutter's built-in solutions. No third-party unless explicitly requested.

- **ValueNotifier + ValueListenableBuilder**: Simple local state (single value)
- **ChangeNotifier + ListenableBuilder**: Complex or shared state
- **Stream + StreamBuilder**: Sequence of async events
- **Future + FutureBuilder**: Single async operation
- **MVVM**: When robust architecture needed, with manual constructor DI

### Navigation

Use `go_router` for declarative navigation, deep linking, web support:
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
```

Use built-in `Navigator` only for short-lived screens (dialogs, temporary views).

### Data & Serialization

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

### Theming

- Use `ColorScheme.fromSeed()` for harmonious palettes
- Define both `theme` and `darkTheme` in `MaterialApp`
- Use `Theme.of(context).textTheme` and `Theme.of(context).colorScheme`
- Custom tokens via `ThemeExtension<T>`

### Logging

Use `dart:developer` instead of `print`:
```dart
import 'dart:developer' as developer;
developer.log('Message', name: 'myapp.module', error: e, stackTrace: s);
```

### Lint Rules

```yaml
include: package:flutter_lints/flutter.yaml
linter:
  rules: {}
```

### Testing

- **Unit**: `package:test` for domain, data, state
- **Widget**: `package:flutter_test` for UI
- **Integration**: `package:integration_test` for e2e
- **Assertions**: Prefer `package:checks` over matchers
- **Pattern**: Arrange-Act-Assert (Given-When-Then)
- **Mocks**: Prefer fakes/stubs. Use `mockito`/`mocktail` only if necessary.

### Documentation

- `///` doc comments for all public APIs
- Start with single-sentence summary
- Explain *why*, not *what*
- Use backticks for code references

### Accessibility

- Color contrast: 4.5:1 minimum
- Test with dynamic text scaling
- Use `Semantics` widget for labels
- Test with TalkBack/VoiceOver

---

## Dart MCP Tools

Use when available (prefer over CLI):

| Tool | When |
|------|------|
| `analyze_files` | After changes |
| `dart_fix` | Auto-fix issues |
| `dart_format` | Before completing |
| `pub` | Add dependencies |
| `pub_dev_search` | Find packages |
| `run_tests` | Verify correctness |

Fallback: `dart analyze`, `dart fix --apply`, `dart format .`, `flutter pub add`, `flutter test`

---

## Implementation Protocol

For **each phase**:

### 1. Announce
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Phase N: <name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2. Dependencies
Use `pub` or `flutter pub add <package>`

### 3. Implement
Follow all Flutter & Dart rules above strictly.

### 4. Code Generation
```shell
dart run build_runner build --delete-conflicting-outputs
```

### 5. Validate
1. `analyze_files` → fix ALL issues
2. `dart_fix` → apply auto-fixes
3. `dart_format` → format code
4. `run_tests` → if applicable

### 6. Report
```
Phase N: <name> — COMPLETE
Files: created X, modified Y
Issues: none
```

## After All Phases

### Final Validation
1. Full `analyze_files`
2. Full `run_tests`
3. `dart_format .`

### Update plan.md
`- [ ]` → `- [x]` for completed tasks. Add completion summary.

### Final Report
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature: <name>
Phases: N/N
Files created: X
Files modified: Y
Tests: passing
Analysis: clean
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
