import 'package:flutter/material.dart';
import 'package:taskly/ui/auth/complete_profile.dart';
import 'package:taskly/ui/auth/widgets/textfields.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SafeArea(
              child: Text(
                'task.io',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            ),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                EmailField(),
                SizedBox(
                  height: 10,
                ),
                PasswordField(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteProfile()));
                    },
                    child: Text('Sign Up')))
          ],
        ),
      ),
    );
  }
}
