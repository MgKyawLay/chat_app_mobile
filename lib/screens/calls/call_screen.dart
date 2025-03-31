import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final List<Map<String, String>> recentCalls = [
    {"name": "Alice", "time": "Today, 10:00 AM", "callType": "incoming"},
    {"name": "Bob", "time": "Today, 9:00 AM", "callType": "outgoing"},
    {"name": "Charlie", "time": "Yesterday, 10:00 PM", "callType": "incoming"},
    {"name": "David", "time": "Yesterday, 9:00 PM", "callType": "outgoing"},
    {"name": "Eve", "time": "Yesterday, 8:00 PM", "callType": "missed"},
    {"name": "Frank", "time": "Yesterday, 7:00 PM", "callType": "outgoing"},
    {"name": "Grace", "time": "Yesterday, 6:00 PM", "callType": "incoming"},
    {"name": "Helen", "time": "Yesterday, 5:00 PM", "callType": "missed"},
    {"name": "Ivy", "time": "Yesterday, 4:00 PM", "callType": "missed"},
    {"name": "Jack", "time": "Yesterday, 3:00 PM", "callType": "outgoing"},
  ];

  CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calls'),
          centerTitle: true,
          leading: const Icon(Icons.search_outlined),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_call),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: recentCalls.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                        ),
                        title: Text(recentCalls[index]["name"]!),
                        subtitle: Row(
                          children: [
                            Icon(
                                recentCalls[index]["callType"] == "incoming"
                                    ? Icons.phone_callback_outlined
                                    : recentCalls[index]["callType"] ==
                                            "outgoing"
                                        ? Icons.phone_callback_outlined
                                        : Icons.phone_missed_rounded,
                                color:
                                    recentCalls[index]["callType"] == "incoming"
                                        ? Colors.green
                                        : recentCalls[index]["callType"] ==
                                                "outgoing"
                                            ? Colors.blue
                                            : Colors.red),
                            Text(recentCalls[index]["time"]!),
                          ],
                        ),
                        trailing:  const Icon(Icons.phone_in_talk_outlined),
                      );
                    })),
          ],
        ));
  }
}
