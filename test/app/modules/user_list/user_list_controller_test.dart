import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:icarros_chat/app/modules/user_list/user_list_controller.dart';
import 'package:icarros_chat/app/modules/user_list/user_list_module.dart';

// void main() {
//   initModule(UserListModule());
//   UserListController userlist;

//   setUp(() {
//     userlist = UserListModule.to.bloc<UserListController>();
//   });

//   group('UserListController Test', () {
//     test("First Test", () {
//       expect(userlist, isInstanceOf<UserListController>());
//     });

//     test("Set Value", () {
//       expect(userlist.value, equals(0));
//       userlist.increment();
//       expect(userlist.value, equals(1));
//     });
//   });
// }
