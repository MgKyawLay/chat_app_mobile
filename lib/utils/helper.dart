import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> contactPermission(BuildContext context) async {
  var status = await Permission.contacts.status;
  if (status.isDenied) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text('This app needs contact access to function properly. Please grant contact access.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Deny'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Allow'),
              onPressed: () {
                Permission.contacts.request();
              },
            ),
          ],
        );
      },
    );
  }
}