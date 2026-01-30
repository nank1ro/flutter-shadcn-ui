import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadForm - Dot Notation', () {
    testWidgets('converts dot notation field IDs to nested map by default', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'user.email',
                  initialValue: 'john@example.com',
                ),
                ShadInputFormField(
                  id: 'user.age',
                  initialValue: '30',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, const {
        'user': {
          'name': 'John',
          'email': 'john@example.com',
          'age': '30',
        },
      });
    });

    testWidgets('supports initial values with nested structure', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: const {
              'user': {
                'name': 'Jane',
                'email': 'jane@example.com',
              },
            },
            child: Column(
              children: [
                ShadInputFormField(id: 'user.name'),
                ShadInputFormField(id: 'user.email'),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'Jane',
          'email': 'jane@example.com',
        },
      });
    });

    testWidgets('handles mixed flat and nested field IDs', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'username',
                  initialValue: 'john_doe',
                ),
                ShadInputFormField(
                  id: 'user.email',
                  initialValue: 'john@example.com',
                ),
                ShadInputFormField(
                  id: 'user.profile.bio',
                  initialValue: 'Developer',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'username': 'john_doe',
        'user': {
          'email': 'john@example.com',
          'profile': {
            'bio': 'Developer',
          },
        },
      });
    });

    testWidgets('uses custom separator when specified', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            fieldIdSeparator: '/',
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user/name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'user/email',
                  initialValue: 'john@example.com',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'John',
          'email': 'john@example.com',
        },
      });
    });

    testWidgets('disables dot notation when fieldIdSeparator is null', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            fieldIdSeparator: null,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'user.email',
                  initialValue: 'john@example.com',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      // Should remain as flat keys
      expect(formValue, const {
        'user.name': 'John',
        'user.email': 'john@example.com',
      });
    });

    testWidgets('preserves custom initial values in nested structure', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: const {
              'user': {
                'name': 'Initial Name',
                'country': 'Italy', // No field for this
              },
              'custom_field': 'custom_value',
            },
            child: Column(
              children: [
                ShadInputFormField(id: 'user.name'),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'Initial Name',
          'country': 'Italy', // Preserved from initial value
        },
        'custom_field': 'custom_value',
      });
    });

    testWidgets('handles deeply nested dot notation', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'company.department.team.member.name',
                  initialValue: 'Alice',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, const {
        'company': {
          'department': {
            'team': {
              'member': {
                'name': 'Alice',
              },
            },
          },
        },
      });
    });

    testWidgets('updates nested values correctly', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.name',
                  initialValue: 'John',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Update the value
      formKey.currentState!.setFieldValue('user.name', 'Jane');
      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'Jane',
        },
      });
    });

    testWidgets('works with different form field types', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.name',
                  initialValue: 'John',
                ),
                ShadCheckboxFormField(
                  id: 'user.active',
                  initialValue: true,
                  label: const Text('Active'),
                ),
                ShadSwitchFormField(
                  id: 'user.verified',
                  initialValue: false,
                  label: const Text('Verified'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'John',
          'active': true,
          'verified': false,
        },
      });
    });
  });

  group('ShadForm - Array Notation', () {
    testWidgets('converts array notation field IDs to nested lists', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'users.[0].email',
                  initialValue: 'john@example.com',
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Jane',
                ),
                ShadInputFormField(
                  id: 'users.[1].email',
                  initialValue: 'jane@example.com',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'users': [
          {'name': 'John', 'email': 'john@example.com'},
          {'name': 'Jane', 'email': 'jane@example.com'},
        ],
      });
    });

    testWidgets('creates array structure from field IDs', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'Alice',
                ),
                ShadInputFormField(
                  id: 'users.[0].email',
                  initialValue: 'alice@example.com',
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Bob',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'users': [
          {'name': 'Alice', 'email': 'alice@example.com'},
          {'name': 'Bob'},
        ],
      });
    });

    testWidgets('handles mixed flat, nested, and array field IDs', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'username',
                  initialValue: 'admin',
                ),
                ShadInputFormField(
                  id: 'user.email',
                  initialValue: 'admin@example.com',
                ),
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Jane',
                ),
                ShadInputFormField(
                  id: 'active',
                  initialValue: 'true',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'username': 'admin',
        'user': {'email': 'admin@example.com'},
        'users': [
          {'name': 'John'},
          {'name': 'Jane'},
        ],
        'active': 'true',
      });
    });

    testWidgets('uses array notation with custom separator', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            fieldIdSeparator: '/',
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users/[0]/name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'users/[1]/name',
                  initialValue: 'Jane',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'users': [
          {'name': 'John'},
          {'name': 'Jane'},
        ],
      });
    });

    testWidgets('updates array field values correctly', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Jane',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Update array field values
      formKey.currentState!.setFieldValue('users.[0].name', 'Alice');
      formKey.currentState!.setFieldValue('users.[1].name', 'Bob');
      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'users': [
          {'name': 'Alice'},
          {'name': 'Bob'},
        ],
      });
    });

    testWidgets('handles deeply nested array notation', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'company.team.[0].members.[0].name',
                  initialValue: 'Alice',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, const {
        'company': {
          'team': [
            {
              'members': [
                {'name': 'Alice'},
              ],
            },
          ],
        },
      });
    });

    testWidgets('works with different form field types and array notation', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'John',
                ),
                ShadCheckboxFormField(
                  id: 'users.[0].active',
                  initialValue: true,
                  label: const Text('Active'),
                ),
                ShadSwitchFormField(
                  id: 'users.[0].verified',
                  initialValue: false,
                  label: const Text('Verified'),
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Jane',
                ),
                ShadCheckboxFormField(
                  id: 'users.[1].active',
                  initialValue: false,
                  label: const Text('Active'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'users': [
          {'name': 'John', 'active': true, 'verified': false},
          {'name': 'Jane', 'active': false},
        ],
      });
    });

    testWidgets('creates array structure from field IDs with initial values', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'users.[0].name',
                  initialValue: 'Initial Name',
                ),
                ShadInputFormField(
                  id: 'users.[1].name',
                  initialValue: 'Second User',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      // The form correctly creates array structure from field IDs
      expect(formValue, containsPair('users', isA<List>()));
      expect((formValue['users'] as List)[0], containsPair('name', 'Initial Name'));
      expect((formValue['users'] as List)[1], containsPair('name', 'Second User'));
    });

    testWidgets('backward compatibility - existing dot notation still works', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.name',
                  initialValue: 'John',
                ),
                ShadInputFormField(
                  id: 'user.email',
                  initialValue: 'john@example.com',
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, {
        'user': {
          'name': 'John',
          'email': 'john@example.com',
        },
      });
    });
  });

  group('ShadForm - Value Transformers with Dot Notation', () {
    testWidgets('applies transformers to nested values', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: const {
              'user': {
                'age': '30',
              },
            },
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'user.age',
                  toValueTransformer: (value) => value,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final formValue = formKey.currentState!.value;

      expect(formValue, const {
        'user': {
          'age': '30',
        },
      });
    });
  });
}
