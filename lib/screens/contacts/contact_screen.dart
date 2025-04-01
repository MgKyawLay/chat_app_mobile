import 'package:chat_app_mobile/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  void initState() {
    super.initState();
    contactPermission(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_alt)),
        ],
      ),
      body: Center(child: Text("data"),),
    );
  }
}
