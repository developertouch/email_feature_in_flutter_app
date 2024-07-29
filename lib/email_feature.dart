
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class email_feature extends StatefulWidget {
  const email_feature({super.key});

  @override
  State<email_feature> createState() => _email_featureState();
}

class _email_featureState extends State<email_feature> {
  final key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

  sendEmail(String body, String subject, String recipient) async {
    final Email email = Email(
        body: body, subject: subject, recipients: [recipient], isHTML: false);
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Email Feature in Flutter App",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: subject,
                decoration: InputDecoration(
                  hintText: "Enter subject",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: body,
                decoration: InputDecoration(
                  hintText: "Enter body",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.black),
                ),
                  onPressed: () {
                    key.currentState!.save();
                    sendEmail(subject.text, body.text, email.text);
                    // clear the textfield after sending the mail
                    body.clear();
                    subject.clear();
                    email.clear();
                  },
                  child: Text(
                    "Send Mail",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ),
      ),
    );
  }
}
