import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/main.dart';

void main() {
  testWidgets('Restaurant App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RestaurantApp());
    expect(find.text('Welcome to Restaurant App'), findsOneWidget);
  });
}
