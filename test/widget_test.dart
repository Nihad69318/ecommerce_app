import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/core/storage/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    // টেস্ট এনভায়রনমেন্টে SharedPreferences-এর জন্য মক ডেটা সেট করা
    SharedPreferences.setMockInitialValues({});

    final preferenceService = await PreferenceService.init();
    final dioClient = DioClient(preferenceService: preferenceService);

    await tester.pumpWidget(
      MyApp(
        dioClient: dioClient,
        preferenceService: preferenceService,
      ),
    );

    await tester.pumpAndSettle();

    // আপনার অ্যাপের প্রথম স্ক্রিনের কোনো টেক্সট বা উইজেট দিয়ে নিচের assert আপডেট করে নেবেন
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}