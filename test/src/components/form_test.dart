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
    testWidgets('converts dot notation field IDs to nested map by default',
        (tester) async {
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
        }
      });
    });

    testWidgets('supports initial values with dot notation', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: {
              'user.name': 'Jane',
              'user.email': 'jane@example.com',
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
        }
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
          }
        }
      });
    });

    testWidgets('uses custom separator when specified', (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            dotNotationSeparator: '/',
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
        }
      });
    });

    testWidgets('disables dot notation when enableDotNotation is false',
        (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            enableDotNotation: false,
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

    testWidgets('preserves custom initial values with dot notation',
        (tester) async {
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: {
              'user.name': 'Initial Name',
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
              }
            }
          }
        }
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
        }
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
        }
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
              'user.age': '30',
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
        }
      });
    });
  });
}
