import 'dart:io';

import 'package:flutter/services.dart';

mixin WebeViewTextInput implements TextInputClient {
  @override
  TextEditingValue? currentTextEditingValue;

  @override
  AutofillScope? currentAutofillScope;

  TextInputConnection? _textInputConnection;

  attachTextInputClient() {
    _textInputConnection?.close();
    _textInputConnection = TextInput.attach(
        this, const TextInputConfiguration(enableDeltaModel: false));
    if (!Platform.isWindows) {
      _textInputConnection?.show();
    }
    // _textInputConnection
  }

  detachTextInputClient() {
    _textInputConnection?.close();
  }

  @override
  didChangeInputControl(
      TextInputControl? oldControl, TextInputControl? newControl) {
    print("changed input control");
  }

  @override
  connectionClosed() {}

  @override
  insertTextPlaceholder(Size size) {}

  @override
  insertContent(KeyboardInsertedContent content) {
    print("insertContent");
  }

  @override
  performAction(TextInputAction action) {}

  @override
  performPrivateCommand(String action, Map<String, dynamic> data) {}

  @override
  performSelector(String selectorName) {}

  @override
  removeTextPlaceholder() {}

  @override
  showAutocorrectionPromptRect(int start, int end) {}

  @override
  showToolbar() {}

  @override
  updateEditingValue(TextEditingValue value) {
    currentTextEditingValue = value;
  }

  @override
  updateFloatingCursor(RawFloatingCursorPoint point) {}
}
