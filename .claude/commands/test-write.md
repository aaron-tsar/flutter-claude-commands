You are generating tests for this Flutter project.

## Target

$ARGUMENTS

If path provided: generate tests for that file/directory.
If not provided: generate tests for recently modified files.

## Rules Reference

Follow testing rules in `CLAUDE.md`.

## Protocol

### 1. Analyze Target Code

Read the target file(s) and identify:
- Public classes and methods
- Business logic functions
- State management code
- API/Repository methods
- Edge cases and error paths

### 2. Determine Test Types Needed

| Code Type | Test Type | Location |
|-----------|-----------|----------|
| Models, Utils, Services | Unit | `test/unit/` |
| Widgets, Screens | Widget | `test/widget/` |
| User flows | Integration | `integration_test/` |

### 3. Generate Unit Tests

For each public function/method:

```dart
import 'package:test/test.dart';
import 'package:checks/checks.dart';

void main() {
  group('ClassName', () {
    late ClassName sut; // system under test
    
    setUp(() {
      sut = ClassName();
    });

    group('methodName', () {
      test('should return expected result when valid input', () {
        // Arrange
        final input = ...;
        
        // Act
        final result = sut.methodName(input);
        
        // Assert
        check(result).equals(expected);
      });

      test('should throw exception when invalid input', () {
        check(() => sut.methodName(null)).throws<ArgumentError>();
      });

      test('should handle edge case', () {
        // Test boundary conditions
      });
    });
  });
}
```

### 4. Test Case Checklist

For each function, generate tests for:
- [ ] Happy path (valid input → expected output)
- [ ] Null/empty inputs
- [ ] Boundary values (min, max, zero)
- [ ] Error conditions (exceptions, failures)
- [ ] Async behavior (if applicable)
- [ ] State changes (if stateful)

### 5. Mock Dependencies

Use fakes/stubs when possible. If mocking needed:

```dart
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements Repository {}

// In test
final mockRepo = MockRepository();
when(() => mockRepo.getData()).thenAnswer((_) async => testData);
```

### 6. Verify Coverage

After generating, estimate coverage:
- Target: ≥80% line coverage
- List any uncovered paths

### 7. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TESTS GENERATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Target: <file/directory>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Unit tests:   X files, Y test cases
Widget tests: X files, Y test cases
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Estimated coverage: ~XX%
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 8. Next Step

> Tests generated. Choose next action:
> - `/test:unit` → Run unit tests
> - `/test:coverage` → Check actual coverage
> - `/test:write:widget` → Generate widget tests
