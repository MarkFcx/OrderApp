// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "company": MessageLookupByLibrary.simpleMessage(
            "Hangzhou Jianjia Robot Co., LTD"),
        "copyright1":
            MessageLookupByLibrary.simpleMessage("Property in copyright"),
        "copyright2":
            MessageLookupByLibrary.simpleMessage("All rights reserved."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_success":
            MessageLookupByLibrary.simpleMessage("Log in successfully!"),
        "no_exist_user":
            MessageLookupByLibrary.simpleMessage("The user does not exist!"),
        "no_input_for_login": MessageLookupByLibrary.simpleMessage(
            "The user name or password cannot be empty!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_error":
            MessageLookupByLibrary.simpleMessage("Password is error!"),
        "setup": MessageLookupByLibrary.simpleMessage("Setup"),
        "unit": MessageLookupByLibrary.simpleMessage("Unit"),
        "user_name": MessageLookupByLibrary.simpleMessage("User Name"),
        "voice": MessageLookupByLibrary.simpleMessage("Voice"),
        "welcome_login":
            MessageLookupByLibrary.simpleMessage("Welcome, Please login")
      };
}
