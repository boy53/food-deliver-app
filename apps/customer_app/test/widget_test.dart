import 'package:flutter_test/flutter_test.dart';
import 'package:customer_app/main.dart';

void main() {
  testWidgets('Customer App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CustomerApp());
    expect(find.text('Welcome to Customer App'), findsOneWidget);
  });
}
