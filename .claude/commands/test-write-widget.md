You are generating widget tests for this Flutter project.

## Target

$ARGUMENTS

If path provided: generate widget tests for that widget/screen.
If not provided: generate tests for recently modified widgets.

## Rules Reference

Follow testing rules in `CLAUDE.md`.

## Protocol

### 1. Identify Widget Under Test

Read target widget and identify:
- Widget type (StatelessWidget, StatefulWidget)
- Required parameters
- State management used
- Child widgets
- User interactions (tap, input, scroll)
- Navigation triggers

### 2. Create Test File

Location: `test/widget/<mirror_path>_test.dart`

Example:
- `lib/features/auth/presentation/login_screen.dart`
- → `test/widget/features/auth/presentation/login_screen_test.dart`

### 3. Test Structure

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:checks/checks.dart';

import 'package:app/features/auth/presentation/login_screen.dart';

void main() {
  group('LoginScreen', () {
    late Widget sut;

    setUp(() {
      sut = const MaterialApp(
        home: LoginScreen(),
      );
    });

    testWidgets('renders email and password fields', (tester) async {
      await tester.pumpWidget(sut);

      check(find.byType(TextField)).findsNWidgets(2);
      check(find.text('Email')).findsOneWidget();
      check(find.text('Password')).findsOneWidget();
    });

    testWidgets('shows error when email empty and submit pressed', (tester) async {
      await tester.pumpWidget(sut);

      // Tap login button without entering email
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      check(find.text('Email is required')).findsOneWidget();
    });

    testWidgets('navigates to home on successful login', (tester) async {
      await tester.pumpWidget(sut);

      // Enter valid credentials
      await tester.enterText(find.byKey(Key('email')), 'test@example.com');
      await tester.enterText(find.byKey(Key('password')), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      check(find.byType(HomeScreen)).findsOneWidget();
    });

    testWidgets('shows loading indicator during login', (tester) async {
      await tester.pumpWidget(sut);

      await tester.enterText(find.byKey(Key('email')), 'test@example.com');
      await tester.enterText(find.byKey(Key('password')), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(); // Don't settle, check loading state

      check(find.byType(CircularProgressIndicator)).findsOneWidget();
    });
  });
}
```

### 4. Widget Test Checklist

- [ ] Widget renders correctly
- [ ] All required UI elements present
- [ ] User interactions work (tap, input, scroll)
- [ ] Form validation displays errors
- [ ] Loading states shown
- [ ] Error states displayed
- [ ] Navigation triggers correctly
- [ ] Accessibility labels present

### 5. Testing Interactions

```dart
// Tap
await tester.tap(find.byType(ElevatedButton));

// Enter text
await tester.enterText(find.byType(TextField), 'text');

// Scroll
await tester.drag(find.byType(ListView), Offset(0, -300));

// Long press
await tester.longPress(find.byKey(Key('item')));

// Wait for animations
await tester.pumpAndSettle();

// Wait specific duration
await tester.pump(Duration(seconds: 1));
```

### 6. Mocking Dependencies

```dart
// Wrap with providers if needed
Widget createSut() {
  return MaterialApp(
    home: Provider<AuthRepository>(
      create: (_) => FakeAuthRepository(),
      child: const LoginScreen(),
    ),
  );
}
```

### 7. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WIDGET TESTS GENERATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Source: <source_file>
Test:   <test_file>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Widgets: X
Test cases: Y
Interactions: Z
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 8. Next Step

> Widget tests generated. Choose next action:
> - `/test:widget` → Run widget tests
> - `/test:coverage` → Check coverage
> - `/test:integration` → Run integration tests
