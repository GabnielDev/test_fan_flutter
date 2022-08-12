import 'package:flutter/material.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[_textField(), _buildButton(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.blueGrey),
            ),
            style: const TextStyle(color: Colors.black),
            autofocus: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nama",
              hintStyle: TextStyle(color: Colors.blueGrey),
            ),
            style: const TextStyle(color: Colors.black),
            autofocus: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextFormField(
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
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Konfimasi Password",
              hintStyle: TextStyle(color: Colors.blueGrey),
            ),
            style: const TextStyle(color: Colors.black),
            obscureText: true,
            autofocus: false,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Text(
              'Registrasi',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
      ],
    );
  }
}
