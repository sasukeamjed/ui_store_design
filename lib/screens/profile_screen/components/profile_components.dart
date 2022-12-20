import 'package:flutter/material.dart';

class ProfileComponents extends StatelessWidget {
  const ProfileComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("My orders"),
          subtitle: Text("Already have 12 orders"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("My orders"),
          subtitle: Text("Already have 12 orders"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("My orders"),
          subtitle: Text("Already have 12 orders"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("My orders"),
          subtitle: Text("Already have 12 orders"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("My orders"),
          subtitle: Text("Already have 12 orders"),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),

      ],
    );
  }
}
