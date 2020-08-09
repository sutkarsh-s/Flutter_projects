import 'package:flutter/material.dart';
import '../../constants.dart';

enum Field { name, phone, email }

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String name = "Profile Name", phone = "Phone number", emailId = "Email ID";

  Future<bool> onPressed(String text, Field field) async {
    final textController = TextEditingController();
    textController.text = text;
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Change the field'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  switch (field) {
                    case Field.name:
                      name = textController.text.trim();
                      break;
                    case Field.phone:
                      phone = textController.text.trim();
                      break;
                    default:
                  }
                  textController.dispose();
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget _detailTile(String text, Field field) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: GestureDetector(
        onTap: () {
          if (field != Field.email) {
            onPressed(text, field);
          }
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.adjust,
              color: themeYellow,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 100,
            ),
            Text('Profile Details'),
            Image.asset(
              'images/empty-picture.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _detailTile(name, Field.name),
                  _detailTile(phone, Field.phone),
                  _detailTile(emailId, Field.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
