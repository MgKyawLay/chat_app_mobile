import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts;
  Map<String, List<Contact>> _groupedContact = {};
  bool _isPermissionDenied = false;

  @override
  void initState() {
    super.initState();
    getContactFromDevice();
  }

  Future<void> getContactFromDevice() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() {
        _isPermissionDenied = true;
      });
    } else {
      final contacts = await FlutterContacts.getContacts(withPhoto: true);
      setState(() {
        _contacts = contacts;
        _groupedContact = _groupContacts(contacts);
      });
    }
  }

  Map<String, List<Contact>> _groupContacts(List<Contact> contacts) {
    Map<String, List<Contact>> groupedContacts = {};

    for (var contact in contacts) {
      if (contact.displayName.isEmpty) continue;

      String firstLetter = contact.displayName[0].toUpperCase();

      // Check if the first letter is alphabetical, otherwise group under '#'
      if (!RegExp(r'^[A-Z]$').hasMatch(firstLetter)) {
        firstLetter = '#';
      }

      if (!groupedContacts.containsKey(firstLetter)) {
        groupedContacts[firstLetter] = [];
      }

      groupedContacts[firstLetter]!.add(contact);
    }

    // Sort the groups alphabetically
    var sortedKeys = groupedContacts.keys.toList()..sort();
    Map<String, List<Contact>> sortedGroupedContacts = {
      for (var key in sortedKeys) key: groupedContacts[key]!
    };

    // Sort contacts within each group
    for (var group in sortedGroupedContacts.keys) {
      sortedGroupedContacts[group]!
          .sort((a, b) => a.displayName.compareTo(b.displayName));
    }

    return sortedGroupedContacts;
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
      body: body(),
    );
  }

  Widget body() {
    if (_isPermissionDenied) {
      return const Center(
        child: Text("Permission required!"),
      );
    }
    if (_contacts == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: _groupedContact.keys.length,
        itemBuilder: (context, index) {
          String group = _groupedContact.keys.elementAt(index);
          List<Contact> groupContacts = _groupedContact[group]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  group,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...groupContacts.map((contact) => ListTile(
                    title: Text(contact.displayName),
                  ))
            ],
          );
        });
  }
}
