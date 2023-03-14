import "package:flutter/material.dart";
import "./login_screen.dart";
import "./register_screen.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Size buttonSize = Size(size.width * 0.33, size.height * 0.08);
    //buttonSize.height = size.height * 0.5;

    return Scaffold(
      body: Center(
        //Stack is used to keep the background as Image.
        child: Stack(
          children: [
            // Image is set from the assets folder.
            Image.asset("assets/ManOnHomeScreen.png",
                height: size.height * 0.9),
            //Login and Register Buttons are rendered from top 150px and right 0px away.
            Positioned(
              top: size.height * 0.25,
              right: size.width * 0.08,
              child: Column(
                children: [
                  //Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      //fixedSize: buttonSize,
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
                      //fixedSize: buttonSize,
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
