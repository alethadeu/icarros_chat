import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:icarros_chat/app/modules/chat/chat_page.dart';

main() {
  testWidgets('ChatPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ChatPage(title: 'Chat')));
    final titleFinder = find.text('Chat');
    expect(titleFinder, findsOneWidget);
  });
}
