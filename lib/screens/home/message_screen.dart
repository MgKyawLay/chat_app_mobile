import 'package:flutter/material.dart';

import 'incoming_call_screen.dart';

class MessageScreen extends StatefulWidget {
  final String imageUrl;
  final int index;

  const MessageScreen({super.key, required this.imageUrl, required this.index});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello!", "isSender": true},
    {"text": "How are you?", "isSender": false},
    {"text": "I'm good, thanks!", "isSender": true},
    {"text": "What about you?", "isSender": false},
    {"text": "I'm doing well too.", "isSender": true},
    {"text": "Great to hear!", "isSender": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ${widget.index}'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IncomingCallScreen(
                      callerName: 'User ${widget.index}',
                      callerImageUrl: widget.imageUrl);
                }));
              },
              icon: const Icon(Icons.call_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.videocam_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: _messages[index]["isSender"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: _messages[index]["isSender"]
                          ? Colors.blue[100]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(_messages[index]["text"]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      _messages
                          .add({"text": _controller.text, "isSender": true});
                      _controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
