import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

abstract class GitOperations {
  static bool get isGitRepository {
    final value = Process.runSync('git', [
      'rev-parse',
      '--is-inside-work-tree',
    ]);
    return value.exitCode == 0;
  }

  static String getGitRepositoryPath() {
    final path = Process.runSync('git', ['rev-parse', '--show-toplevel']);
    return path.stdout.toString().trim();
  }

  static Future<String> fetchFileFromGitHub({
    required String path,
    String? token,
    String branch = 'main', // Default branch
  }) async {
    final url =
        'https://api.github.com/repos/nank1ro/flutter-shadcn-ui/contents/$path?ref=$branch';
    final headers = {
      'Accept': 'application/vnd.github.v3+json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('json: ${json['sha']}');
        if (json['content'] != null) {
          // Decode Base64 content
          final content = base64Decode(
            (json['content'] as String).replaceAll('\n', ''),
          );
          return utf8.decode(content);
        } else {
          throw Exception('File content not found in response');
        }
      } else if (response.statusCode == 404) {
        throw Exception(
          'File not found at $path in nank1ro/flutter-shadcn-ui ($branch branch)',
        );
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception(
          'Authentication failed. Invalid token or insufficient permissions',
        );
      } else {
        throw Exception(
          'Failed to fetch file: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching file from GitHub: $e');
    }
  }

  static String calculateHashOfFile(List<int> contents) {
    try {
      // Create "blob <size>" prefix
      final prefix = utf8.encode('blob ${contents.length}');

      // Combine prefix, NULL byte, and contents
      final combined = [...prefix, 0, ...contents];

      // Compute SHA-1 hash
      final hashBytes = sha1.convert(combined);

      // Convert to hex string
      return hashBytes.bytes
          .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
          .join('');
    } catch (e) {
      throw Exception('Failed to calculate hash: $e');
    }
  }
}
