import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_fan_flutter/screens/home/homepage.dart';
import 'package:test_fan_flutter/screens/login/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loginBloc.initializationFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[_textField()],
                        ),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Widget _textField() {
    final edtEmail = TextEditingController();
    final edtPassword = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextFormField(
              controller: edtEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.blueGrey),
              ),
              style: const TextStyle(color: Colors.black),
              autofocus: false,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextFormField(
            controller: edtPassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.blueGrey),
            ),
            style: const TextStyle(color: Colors.black),
            obscureText: true,
            autofocus: false,
          ),
        ),
        InkWell(
          onTap: () =>
              loginBloc.onClickLogin(context, edtEmail.text, edtPassword.text),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        InkWell(
          onTap: () async {
            User? user = await loginBloc.onClickLogin(
                context, edtEmail.text, edtPassword.text);
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          child: const Text(
            'Belum mempunyai Account? Daftar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
