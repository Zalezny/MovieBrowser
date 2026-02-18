import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/search_box.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchBox matches golden', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        home: Scaffold(
          body: Column(
            children: [
              SearchBox(onSubmitted: (_) {}),
            ],
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(SearchBox),
      matchesGoldenFile('goldens/search_box.png'),
    );
  });
}
