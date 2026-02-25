You are generating unit tests for this Flutter project.

## Target

$ARGUMENTS

If path provided: generate unit tests for that file.
If not provided: generate unit tests for recently modified lib/ files.

## Rules Reference

Follow testing rules in `CLAUDE.md`. Use `package:checks` for assertions.

## Protocol

### 1. Identify Testable Units

Read target file and list:
- Public classes
- Public methods/functions
- Business logic
- Data transformations
- Validation logic

### 2. Create Test File

Location: `test/unit/<mirror_path>_test.dart`

Example:
- `lib/features/auth/data/auth_repository.dart`
- → `test/unit/features/auth/data/auth_repository_test.dart`

### 3. Test Structure

```dart
import 'package:test/test.dart';
import 'package:checks/checks.dart';

import 'package:app/features/auth/data/auth_repository.dart';

void main() {
  group('AuthRepository', () {
    late AuthRepository sut;
    
    setUp(() {
      sut = AuthRepository();
    });

    tearDown(() {
      // cleanup if needed
    });

    group('login', () {
      test('returns user when credentials valid', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        
        // Act
        final result = await sut.login(email, password);
        
        // Assert
        check(result).isNotNull();
        check(result.email).equals(email);
      });

      test('throws AuthException when credentials invalid', () {
        check(
          () => sut.login('invalid', 'wrong'),
        ).throws<AuthException>();
      });

      test('throws ArgumentError when email empty', () {
        check(
          () => sut.login('', 'password'),
        ).throws<ArgumentError>();
      });
    });
  });
}
```

### 4. Coverage Requirements

For each public method, test:
- [ ] Success case (happy path)
- [ ] Null inputs (if nullable)
- [ ] Empty inputs (strings, lists)
- [ ] Boundary values
- [ ] Error/exception cases
- [ ] Async completion (Future/Stream)

### 5. Mocking Strategy

Prefer fakes over mocks:

```dart
// Fake (preferred)
class FakeAuthApi implements AuthApi {
  @override
  Future<User> login(String email, String password) async {
    if (email == 'valid@test.com') return User(email: email);
    throw AuthException('Invalid');
  }
}

// Mock (when fake is complex)
class MockAuthApi extends Mock implements AuthApi {}
```

### 6. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
UNIT TESTS GENERATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Source: <source_file>
Test:   <test_file>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Classes: X
Methods: Y
Test cases: Z
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 7. Next Step

> Unit tests generated. Choose next action:
> - `/test:unit` → Run unit tests
> - `/test:coverage` → Check coverage
> - `/test:write:widget` → Generate widget tests
