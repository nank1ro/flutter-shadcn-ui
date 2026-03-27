import 'dart:js_interop';

import 'package:shadcn_ui/src/utils/clipboard/clipboard_service.dart';
import 'package:web/web.dart' as web;

final _listeners = <PasteFilesCallback>{};
bool _initialized = false;

void _ensureInitialized() {
  if (_initialized) return;
  _initialized = true;
  web.document.addEventListener(
    'paste',
    _onPaste.toJS,
  );
}

void _onPaste(web.Event event) {
  if (_listeners.isEmpty) return;
  final clipboardEvent = event as web.ClipboardEvent;
  final data = clipboardEvent.clipboardData;
  if (data == null) return;

  _extractFiles(data).then((files) {
    if (files.isNotEmpty) {
      for (final listener in [..._listeners]) {
        listener(files);
      }
    }
  });
}

Future<List<ShadClipboardItem>> _extractFiles(web.DataTransfer data) async {
  final results = <ShadClipboardItem>[];
  final items = data.items;
  for (var i = 0; i < items.length; i++) {
    final item = items[i];
    if (item.kind == 'file') {
      final file = item.getAsFile();
      if (file != null) {
        final buffer = await file.arrayBuffer().toDart;
        results.add((
          mimeType: file.type,
          bytes: buffer.toDart.asUint8List(),
        ));
      }
    }
  }
  return results;
}

void addPasteFilesListener(PasteFilesCallback callback) {
  _ensureInitialized();
  _listeners.add(callback);
}

void removePasteFilesListener(PasteFilesCallback callback) {
  _listeners.remove(callback);
}
