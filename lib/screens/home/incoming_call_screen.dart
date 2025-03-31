import 'package:chat_app_mobile/screens/home/answer_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IncomingCallScreen extends StatelessWidget {
  final String callerName;
  final String callerImageUrl;

  const IncomingCallScreen(
      {super.key, required this.callerName, required this.callerImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              callerImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(40),
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(callerImageUrl),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        callerName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Incoming call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone_disabled_outlined,
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Decline',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SlideAction(
                      text: 'slide to answer',
                      sliderButtonIcon: const Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                      outerColor: const Color.fromRGBO(255, 255, 255, 0.25),
                      elevation: 0,
                      sliderRotate: false,
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white),
                      onSubmit: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AnswerScreen(
                            imageUrl: callerImageUrl,
                          );
                        }));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
