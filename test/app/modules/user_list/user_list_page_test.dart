import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:icarros_chat/app/modules/user_list/user_list_page.dart';

main() {
  testWidgets('UserListPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(UserListPage(title: 'UserList')));
    final titleFinder = find.text('UserList');
    expect(titleFinder, findsOneWidget);
  });
}
