// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于软件"),
        "company": MessageLookupByLibrary.simpleMessage("XXXXXX有限公司"),
        "copyright1": MessageLookupByLibrary.simpleMessage("版权所有"),
        "copyright2": MessageLookupByLibrary.simpleMessage("保留所有权利"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "login_success": MessageLookupByLibrary.simpleMessage("登录成功！"),
        "no_exist_user": MessageLookupByLibrary.simpleMessage("用户不存在！"),
        "no_input_for_login":
            MessageLookupByLibrary.simpleMessage("用户名或密码不能为空！"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "password_error": MessageLookupByLibrary.simpleMessage("密码输入错误！"),
        "setup": MessageLookupByLibrary.simpleMessage("设置"),
        "unit": MessageLookupByLibrary.simpleMessage("压力单位"),
        "user_name": MessageLookupByLibrary.simpleMessage("用户名"),
        "voice": MessageLookupByLibrary.simpleMessage("声音"),
        "welcome_login": MessageLookupByLibrary.simpleMessage("欢迎您，请登录")
      };
}
