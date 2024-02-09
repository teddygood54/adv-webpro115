import 'package:flutter/material.dart';
import 'package:concetticket3/SeatingPlanPage.dart';
import 'package:concetticket3/PaymentPage.dart';
import 'package:concetticket3/ConfirmationPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concert Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Define the initial route
     routes: {
        '/': (context) => SeatingPlanPage(),
        '/payment': (context) => Paymen(),
        '/confirmation': (context) => ConfirmationPage(
              seat: '',
            ),
      },
    );
  }
}
