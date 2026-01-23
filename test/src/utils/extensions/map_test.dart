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
          },
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
            },
          },
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
            },
          },
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
          },
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
          },
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
          },
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
          },
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
                  },
                },
              },
            },
          },
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

    group('getByPath', () {
      test('retrieves simple nested value', () {
        final map = {
          'user': {
            'name': 'John',
            'email': 'john@example.com',
          },
        };

        expect(map.getByPath('user.name'), 'John');
        expect(map.getByPath('user.email'), 'john@example.com');
      });

      test('retrieves deeply nested value', () {
        final map = {
          'user': {
            'profile': {
              'settings': {
                'theme': 'dark',
              },
            },
          },
        };

        expect(map.getByPath('user.profile.settings.theme'), 'dark');
      });

      test('retrieves value with custom separator', () {
        final map = {
          'user': {
            'profile': {
              'age': 30,
            },
          },
        };

        expect(map.getByPath('user/profile/age', separator: '/'), 30);
        expect(map.getByPath('user:profile:age', separator: ':'), 30);
      });

      test('returns null for non-existent path', () {
        final map = {
          'user': {
            'name': 'John',
          },
        };

        expect(map.getByPath('user.email'), null);
        expect(map.getByPath('nonexistent.path'), null);
      });

      test('returns null when intermediate value is not a map', () {
        final map = {
          'user': {
            'name': 'John',
          },
        };

        expect(map.getByPath('user.name.invalid'), null);
      });

      test('retrieves top-level value without separator', () {
        final map = {
          'username': 'john_doe',
          'email': 'john@example.com',
        };

        expect(map.getByPath('username'), 'john_doe');
        expect(map.getByPath('email'), 'john@example.com');
      });

      test('handles various data types as values', () {
        final map = {
          'data': {
            'string': 'text',
            'number': 42,
            'double': 3.14,
            'bool': true,
            'list': [1, 2, 3],
            'map': {'nested': 'value'},
            'nullValue': null,
          },
        };

        expect(map.getByPath('data.string'), 'text');
        expect(map.getByPath('data.number'), 42);
        expect(map.getByPath('data.double'), 3.14);
        expect(map.getByPath('data.bool'), true);
        expect(map.getByPath('data.list'), [1, 2, 3]);
        expect(map.getByPath('data.map'), {'nested': 'value'});
        expect(map.getByPath('data.nullValue'), null);
      });

      test('retrieves nested map object', () {
        final map = {
          'user': {
            'profile': {
              'settings': {
                'theme': 'dark',
                'language': 'en',
              },
            },
          },
        };

        final settings = map.getByPath('user.profile.settings');
        expect(settings, isA<Map<String, dynamic>>());
        expect(settings, {
          'theme': 'dark',
          'language': 'en',
        });
      });

      test('handles empty map', () {
        final map = <String, dynamic>{};
        expect(map.getByPath('any.path'), null);
      });

      test(
        'handles multiple levels with same separator character in value',
        () {
          final map = {
            'user': {
              'email': 'test@example.com',
            },
          };

          // The separator in the value shouldn't affect path traversal
          expect(map.getByPath('user.email'), 'test@example.com');
        },
      );

      test('returns null for empty path segment', () {
        final map = {
          'user': {
            'name': 'John',
          },
        };

        // Path like 'user..name' would have an empty segment
        expect(map.getByPath('user..name'), null);
      });

      test('retrieves value from very deep nesting', () {
        final map = {
          'a': {
            'b': {
              'c': {
                'd': {
                  'e': {
                    'f': 'deep value',
                  },
                },
              },
            },
          },
        };

        expect(map.getByPath('a.b.c.d.e.f'), 'deep value');
      });

      test('handles path with single segment', () {
        final map = {
          'topLevel': 'value',
        };

        expect(map.getByPath('topLevel'), 'value');
      });

      test('works correctly with map created from toNestedMap', () {
        final flatMap = {
          'user.profile.name': 'John',
          'user.profile.age': 30,
          'user.email': 'john@example.com',
        };

        final nestedMap = flatMap.toNestedMap();

        expect(nestedMap.getByPath('user.profile.name'), 'John');
        expect(nestedMap.getByPath('user.profile.age'), 30);
        expect(nestedMap.getByPath('user.email'), 'john@example.com');
      });
    });

    group('deepMerge', () {
      test('merges simple maps', () {
        final map1 = {'a': 1, 'b': 2};
        final map2 = {'b': 3, 'c': 4};

        final result = map1.deepMerge(map2);

        expect(result, {'a': 1, 'b': 3, 'c': 4});
      });

      test('recursively merges nested maps', () {
        final map1 = {
          'user': {
            'name': 'John',
            'country': 'Italy',
          },
          'custom_field': 'custom_value',
        };

        final map2 = {
          'user': {
            'name': 'Jane',
          },
        };

        final result = map1.deepMerge(map2);

        expect(result, {
          'user': {
            'name': 'Jane',
            'country': 'Italy', // Preserved
          },
          'custom_field': 'custom_value',
        });
      });

      test('replaces non-map values', () {
        final map1 = {
          'value': 'old',
          'number': 1,
          'list': [1, 2, 3],
        };

        final map2 = {
          'value': 'new',
          'number': 2,
          'list': [4, 5],
        };

        final result = map1.deepMerge(map2);

        expect(result, {
          'value': 'new',
          'number': 2,
          'list': [4, 5],
        });
      });

      test('handles deeply nested structures', () {
        final map1 = {
          'level1': {
            'level2': {
              'level3': {
                'a': 1,
                'b': 2,
              },
              'other': 'value',
            },
          },
        };

        final map2 = {
          'level1': {
            'level2': {
              'level3': {
                'b': 3,
                'c': 4,
              },
            },
          },
        };

        final result = map1.deepMerge(map2);

        expect(result, {
          'level1': {
            'level2': {
              'level3': {
                'a': 1, // Preserved
                'b': 3, // Updated
                'c': 4, // Added
              },
              'other': 'value', // Preserved
            },
          },
        });
      });

      test('adds new keys to nested maps', () {
        final map1 = {
          'user': {
            'name': 'John',
          },
        };

        final map2 = {
          'user': {
            'email': 'john@example.com',
            'age': 30,
          },
        };

        final result = map1.deepMerge(map2);

        expect(result, {
          'user': {
            'name': 'John',
            'email': 'john@example.com',
            'age': 30,
          },
        });
      });

      test('handles empty maps', () {
        final map1 = <String, dynamic>{'a': 1};
        final map2 = <String, dynamic>{};

        expect(map1.deepMerge(map2), {'a': 1});
        expect(map2.deepMerge(map1), {'a': 1});
      });

      test('overwrites primitive with map', () {
        final map1 = {'user': 'simple_value'};
        final map2 = {
          'user': {'name': 'John'},
        };

        final result = map1.deepMerge(map2);

        expect(result, {
          'user': {'name': 'John'},
        });
      });

      test('overwrites map with primitive', () {
        final map1 = {
          'user': {'name': 'John'},
        };
        final map2 = {'user': 'simple_value'};

        final result = map1.deepMerge(map2);

        expect(result, {'user': 'simple_value'});
      });
    });
  });
}
