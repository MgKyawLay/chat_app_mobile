import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              profileBar(),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    settingItem(
                        title: 'Account',
                        subtitle: 'Privacy and security',
                        icon: const Icon(Icons.vpn_key_outlined)),
                    const SizedBox(
                      height: 25,
                    ),
                    settingItem(
                        title: 'Chat',
                        subtitle: 'Theme and wallpaper',
                        icon: const Icon(Icons.chat_bubble_outline)),
                    const SizedBox(
                      height: 25,
                    ),
                    settingItem(
                        title: 'Notifications',
                        subtitle: 'Tone and vibration',
                        icon: const Icon(Icons.notifications_outlined)),
                    const SizedBox(
                      height: 25,
                    ),
                    settingItem(
                        title: 'Help',
                        subtitle: 'FAQ and support',
                        icon: const Icon(Icons.help_outline)),
                    const SizedBox(
                      height: 25,
                    ),
                    settingItem(
                        title: 'Storage and data',
                        subtitle: 'Manage storage, network usage',
                        icon: const Icon(Icons.sd_storage_outlined)),
                    const SizedBox(
                      height: 25,
                    ),
                    settingItem(
                        title: 'Invite friends', icon: const Icon(Icons.people_alt_outlined)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget profileBar() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://example.com/profile.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bio Text',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.green,
                ))
          ],
        ),
      ),
    );
  }

  Widget settingItem(
      {required String title, String? subtitle, required Widget icon}) {
    return Row(
      children: [
        CircleAvatar(
          child: icon,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
