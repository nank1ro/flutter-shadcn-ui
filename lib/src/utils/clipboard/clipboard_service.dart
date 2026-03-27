import 'dart:typed_data';

import 'package:shadcn_ui/src/utils/clipboard/clipboard_service_stub.dart'
    if (dart.library.js_interop) 'package:shadcn_ui/src/utils/clipboard/clipboard_service_web.dart'
    as impl;

/// A single item read from the system clipboard.
typedef ShadClipboardItem = ({String mimeType, Uint8List bytes});

/// Callback for receiving pasted file items.
typedef PasteFilesCallback = void Function(List<ShadClipboardItem> files);

/// Callback for receiving errors during paste file extraction.
typedef PasteFilesErrorCallback = void Function(Object error);

/// Registers a listener for paste events containing file data.
///
/// On web, listens to the browser `paste` event and extracts file items
/// from the clipboard data. On other platforms, this is a no-op.
///
/// The [callback] is invoked only when the paste contains file items.
void addPasteFilesListener(PasteFilesCallback callback) =>
    impl.addPasteFilesListener(callback);

/// Removes a previously registered paste files listener.
void removePasteFilesListener(PasteFilesCallback callback) =>
    impl.removePasteFilesListener(callback);

/// Registers a listener for errors that occur during paste file extraction.
void addPasteFilesErrorListener(PasteFilesErrorCallback callback) =>
    impl.addPasteFilesErrorListener(callback);

/// Removes a previously registered paste files error listener.
void removePasteFilesErrorListener(PasteFilesErrorCallback callback) =>
    impl.removePasteFilesErrorListener(callback);
