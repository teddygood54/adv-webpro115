import 'package:flutter/material.dart';
import 'confirmationpage.dart'; // Import ConfirmationPage

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Payment Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Please upload proof of payment:'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement file picker
            },
            child: Text('Choose File'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to ConfirmationPage when payment is confirmed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Confirmation(seat: '',)),
              );
            },
            child: Text('Confirm Payment'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Payment QR Code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/payment_qr_code.png', // รูปภาพ QR Code ที่อาจจะมีให้
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '© 2023 Concert Ticket Booking',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
