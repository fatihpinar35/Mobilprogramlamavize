import 'package:flutter/material.dart';
import 'package:usakuzemvize/homePage.dart';
import 'package:usakuzemvize/resetPassword.dart';
import 'package:usakuzemvize/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => loginPage(),
        'homePage': (context) => homePage(),
        'signup': (context) => signup(),
        'resetPassword': (context) => resetPassword()
      },
      initialRoute: '/',
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  userLoginPage createState() => userLoginPage();
}

class userLoginPage extends State<loginPage> {
  String userName;
  String userPass;

  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[500],
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Adı',
                  ),
                  onSaved: (newValue) {
                    userName = newValue;
                  }),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifreniz',
                ),
                onSaved: (newValue) {
                  userPass = newValue;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    child: Text('Üye Ol'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'resetPassword');
                    },
                    child: Text('Şifremi Unuttum'),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text('Giriş Yap'),
                  onPressed: () {
                    loginKey.currentState.save();
                    if (userName != "demo" && userPass != "demo") {
                      debugPrint(
                          'Kullanıcı Adı veya Şifre hatalı Tekrar Deneyiniz!');
                    } else {
                      Navigator.pushNamed(context, 'homePage');
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
