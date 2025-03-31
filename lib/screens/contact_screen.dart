import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Screen'),
      ),
      body: const Center(
        child: Text('This is the Contact Screen'),
      ),
    );
  }
}