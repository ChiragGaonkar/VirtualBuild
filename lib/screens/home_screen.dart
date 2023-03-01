import "package:flutter/material.dart";
import "auth/login_screen.dart";
import "auth/register_screen.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Stack is used to keep the background as Image.
        child: Stack(
          children: [
            // Image is set from the assets folder.
            Image.asset(
              "assets/ManOnHomeScreen.png",
              height: 600,
            ),
            //Login and Register Buttons are rendered from top 150px and right 0px away.
            Positioned(
              top: 150,
              right: 0,
              child: Column(
                children: [
                  //Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Register Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      "Register",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
