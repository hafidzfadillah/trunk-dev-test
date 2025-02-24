import 'package:flutter/material.dart';
import 'package:taskly/ui/auth/widgets/textfields.dart';
import 'package:taskly/ui/core/home_screen.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  DateTime? _dob;

  void openDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now(),
            initialDate: _dob ?? DateTime.now())
        .then(
      (value) {
        if (value != null) {
          setState(() {
            _dob = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: w * 0.1,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BaseField(hintText: 'Your name'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: w,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              openDatePicker();
                            },
                            label: Text(_dob != null
                                ? _dob.toString()
                                : 'Set birthday'),
                            icon: Icon(Icons.calendar_month),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: w,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                          title: 'Taskly',
                                        )));
                          },
                          child: Text('Complete Profile')))
                ],
              ))),
    );
  }
}
