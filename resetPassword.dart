import 'package:flutter/material.dart';

class resetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email;
    final resetPassKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.amber[500],
      body: Form(
        key: resetPassKey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail Adresiniz',
                ),
                onSaved: (newValue) {
                  email = newValue;
                },
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                color: Colors.blue[400],
                child: Text('Gönder'),
                onPressed: () {
                  resetPassKey.currentState.save();
                  debugPrint(
                      "$email  email adresine sifre sıfırlama linki gönderildi");
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
