import 'package:chat_app_mobile/screens/home/message_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _imageList = [
    "https://images.unsplash.com/photo-1578496480157-697fc14d2e55?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1583912086296-be5b665036d3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1576086213369-97a306d36557?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1601961545517-59307b1fbac3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1579684256060-d5a308109e21?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1583912267550-d974311a9a6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1578496479939-722d9dd1cc5b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1582719201952-ea63ac1671dc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1583911860205-72f8ac8ddcbe?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1578496781329-41da6c97ffc4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          title: const Text('Home Screen'),
          centerTitle: true,
          actions: const [
            CircleAvatar(
              child: Text('A'),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: getStoryList(_imageList),
            ),
            Expanded(
                child: Container(
              child: getChatList(_imageList),
            ))
          ],
        ));
  }
}

Widget getStoryList(List<String> imageList) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: imageList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                imageList[index],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'User $index',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
    },
  );
}

Widget getChatList(List<String> imageList) {
  return ListView.builder(
    itemCount: imageList.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageList[index]),
        ),
        title: Text('User $index'),
        subtitle: Text('Message $index'),
        trailing: Text('10:00 AM'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MessageScreen(imageUrl: imageList[index], index: index)));
        },
      );
    },
  );
}
