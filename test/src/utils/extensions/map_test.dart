import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/utils/extensions/map.dart';

void main() {
  group('MapExtensions', () {
    group('toNestedMap', () {
      test('converts simple dot notation to nested map', () {
        final flatMap = {
          'user.name': 'John',
          'user.email': 'john@example.com',
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'user': {
            'name': 'John',
            'email': 'john@example.com',
          }
        });
      });

      test('converts deeply nested dot notation', () {
        final flatMap = {
          'user.profile.settings.theme': 'dark',
          'user.profile.settings.language': 'en',
          'user.profile.bio': 'Developer',
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'user': {
            'profile': {
              'settings': {
                'theme': 'dark',
                'language': 'en',
              },
              'bio': 'Developer',
            }
          }
        });
      });

      test('handles mixed flat and nested keys', () {
        final flatMap = {
          'username': 'john_doe',
          'user.email': 'john@example.com',
          'user.age': 30,
          'active': true,
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'username': 'john_doe',
          'user': {
            'email': 'john@example.com',
            'age': 30,
          },
          'active': true,
        });
      });

      test('handles empty map', () {
        final flatMap = <String, dynamic>{};
        final result = flatMap.toNestedMap();
        expect(result, <String, dynamic>{});
      });

      test('handles map with only flat keys', () {
        final flatMap = {
          'name': 'John',
          'email': 'john@example.com',
          'age': 30,
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'name': 'John',
          'email': 'john@example.com',
          'age': 30,
        });
      });

      test('uses custom separator', () {
        final flatMap = {
          'user/name': 'John',
          'user/email': 'john@example.com',
          'user/profile/age': 30,
        };

        final result = flatMap.toNestedMap(separator: '/');

        expect(result, {
          'user': {
            'name': 'John',
            'email': 'john@example.com',
            'profile': {
              'age': 30,
            }
          }
        });
      });

      test('handles multiple custom separators', () {
        final colonMap = {
          'user:name': 'John',
          'user:email': 'john@example.com',
        };

        final result = colonMap.toNestedMap(separator: ':');

        expect(result, {
          'user': {
            'name': 'John',
            'email': 'john@example.com',
          }
        });
      });

      test('overwrites non-map values when conflict occurs', () {
        final flatMap = {
          'user': 'simple_value',
          'user.email': 'john@example.com',
        };

        final result = flatMap.toNestedMap();

        // The nested structure should override the flat value
        expect(result, {
          'user': {
            'email': 'john@example.com',
          }
        });
      });

      test('handles various data types as values', () {
        final flatMap = {
          'user.name': 'John',
          'user.age': 30,
          'user.active': true,
          'user.score': 95.5,
          'user.tags': ['developer', 'flutter'],
          'user.metadata': {'key': 'value'},
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'user': {
            'name': 'John',
            'age': 30,
            'active': true,
            'score': 95.5,
            'tags': ['developer', 'flutter'],
            'metadata': {'key': 'value'},
          }
        });
      });

      test('handles null values', () {
        final flatMap = {
          'user.name': null,
          'user.email': 'john@example.com',
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'user': {
            'name': null,
            'email': 'john@example.com',
          }
        });
      });

      test('handles keys with multiple levels', () {
        final flatMap = {
          'a.b.c.d.e.f': 'deep value',
        };

        final result = flatMap.toNestedMap();

        expect(result, {
          'a': {
            'b': {
              'c': {
                'd': {
                  'e': {
                    'f': 'deep value',
                  }
                }
              }
            }
          }
        });
      });

      test('preserves order within same level', () {
        final flatMap = {
          'user.z': 'last',
          'user.a': 'first',
          'user.m': 'middle',
        };

        final result = flatMap.toNestedMap();

        expect(result['user'], isA<Map<String, dynamic>>());
        final userMap = result['user'] as Map<String, dynamic>;
        expect(userMap.keys, ['z', 'a', 'm']);
      });
    });
  });
}
