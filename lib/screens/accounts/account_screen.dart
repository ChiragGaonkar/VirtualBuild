import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualbuild/screens/accounts/edit_profile_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/widgets/accounts/customdecorationforaccountinput.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import '../../providers/user_data_provider.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/data_not_found.dart';
import '../../widgets/headerwithmenu.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const routeName = '/account';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with WidgetsBindingObserver {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  var prefeb;
  String name = "";

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildTextFormField(
    TextEditingController inputText,
    String infoText,
  ) {
    return TextFormField(
      minLines: 1,
      maxLines: 4,
      controller: inputText,
      readOnly: true,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: customDecorationForAccountInput(
        context,
        infoText,
        Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reload = ModalRoute.of(context)!.settings.arguments as Map;

    if (reload["reload"] == true) {
      setState(() {});
    }

    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    String imageUrl = "";
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: MyCustomScreen(
        customColor: Theme.of(context).primaryColor,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderWithMenu(
              header: "My Account",
              scaffoldKey: scaffoldKey,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            FutureBuilder(
                future: user_data.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CustomLoadingSpinner();
                  } else if (snapshot.data!.isEmpty) {
                    return const DataNotFound();
                  } else {
                    name = snapshot.data["name"];
                    String email = snapshot.data["email"];
                    _addressController.text = snapshot.data["address"];
                    _phoneNoController.text = snapshot.data["phoneNumber"];
                    imageUrl = snapshot.data["imageUrl"];
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imageUrl),
                          radius: 80,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          email,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        _buildTextFormField(_addressController, "Address"),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        _buildTextFormField(_phoneNoController, "Phone Number"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                      ],
                    );
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Orders",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(DisplayScreen.routeName),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Profile",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(EditProfileScreen.routeName, arguments: {
                    "name": name,
                    "phoneNumber": _phoneNoController.text,
                    "address": _addressController.text,
                    "imageUrl": imageUrl,
                  }),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // _buildTheNavigation(
            //     "Edit Profile",
            //     Navigator.of(context)
            //         .pushNamed(EditProfileScreen.routeName, arguments: {
            //       "name": name,
            //       "phoneNumber": _phoneNoController.text,
            //       "address": _addressController.text
            //     })),
          ],
        ),
      ),
    );
  }
}
