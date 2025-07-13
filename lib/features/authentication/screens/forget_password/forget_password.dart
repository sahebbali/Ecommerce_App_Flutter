import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: const Center(child: Text('Forget Password Form')),
    );
  }
}
