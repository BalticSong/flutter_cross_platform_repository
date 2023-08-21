import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/utils/custom_tab_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomTabBar UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(

            ),
            body: TabBarView(
              children: List.generate(4, (index) => Center(child: Text('Tab $index'))),
            ),
            bottomNavigationBar:CustomTabBar() ,
          ),
        ),
      ),
    );

    expect(find.byType(CustomTabBar), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(4));


  });


}
