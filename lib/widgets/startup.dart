import 'package:flutter/material.dart';
import 'package:reminder_app/screens/create_admin.dart';
import 'package:reminder_app/screens/log_in.dart';
import 'package:reminder_app/screens/sign_up.dart';

class StartUp extends StatelessWidget {
  static const String id = 'startUp';

  const StartUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Welcome 👋 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Expiry Date Reminder. Login As....',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF295c82),
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LogIn();
                          }));
                        },
                        child: const Text(
                          "User",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, CreateAdmin.id);
                        },
                        child: const Text(
                          "Admin",
                          style: TextStyle(
                            color: Color(0xFF295c82),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
