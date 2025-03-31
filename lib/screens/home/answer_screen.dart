import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {

  final String imageUrl;
  const AnswerScreen({super.key, required this.imageUrl});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
