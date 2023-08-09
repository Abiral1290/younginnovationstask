import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:younginnovationstask/src/presentation/view/home_page.dart';

void main(){
  testWidgets('list change test', (tester) async{
    await tester.pumpWidget(
       MaterialApp(
        home:  Homepage(),
      )
    );

    final charac = find.text('Afghanistan');

    expect(charac, findsOneWidget);
  } );
}