import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email;
    String password;
    String password2;
    String userName;

    final signupKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.amber[500],
      body: Form(
        key: signupKey,
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
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kullanıcı Adınız',
                ),
                onSaved: (newValue) {
                  userName = newValue;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifreniz',
                ),
                onSaved: (newValue) {
                  password = newValue;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre Tekrar',
                ),
                onSaved: (newValue) {
                  password2 = newValue;
                },
              ),
              SizedBox(height: 15.0),
              Column(children: <Widget>[
                RaisedButton(
                    color: Colors.blue[400],
                    child: Text('Vazgeç'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    }),
                RaisedButton(
                    color: Colors.blue[400],
                    child: Text('Kaydol'),
                    onPressed: () {
                      signupKey.currentState.save();
                      if (password != password2) {
                        debugPrint(
                            'Girmiş olduğunuz şifreler uyuşmuyor lütfen tekrar deneyiniz');
                      } else {
                        debugPrint("e-Mail Adresi :$email");
                        debugPrint("Şifresi :$password");
                        Navigator.pushNamed(context, '/');
                      }
                    }),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
