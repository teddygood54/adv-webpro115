import 'package:flutter/material.dart';

class Paymen extends StatelessWidget {
  const Paymen({Key? key}) : super(key: key);

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
              // สำหรับการเลือกไฟล์ภาพ
            },
            child: Text('Choose File'),
          ),
          ElevatedButton(
            onPressed: () {
              // สำหรับยืนยันการชำระเงิน
              Navigator.pushNamed(context, '/confirmation');
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
            'assets/payment_qr_code.png', // เปลี่ยนเส้นทางไปยังรูปภาพตามเส้นทางที่เหมาะสม
            width: 200, // ปรับขนาดของรูปภาพตามที่ต้องการ
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
