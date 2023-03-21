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

  Future<Map<String, String>> fetchData() async {
    String? temp;
    Map<String, String> data = {};
    prefeb = await SharedPreferences.getInstance();
    temp = prefeb.getString('address');
    data['address'] = temp.toString();
    temp = prefeb.getString('phoneNumber');
    data['phoneNumber'] = temp.toString();
    return data;
  }

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

  Widget _buildTheNavigation(String heading, String screenToBeRendered) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed(screenToBeRendered),
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ],
    );
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
      decoration: customDecorationForAccountInput(
        context,
        infoText,
        Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
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
            const CircleAvatar(
              backgroundImage: AssetImage("assets/Female.png"),
              radius: 80,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            FutureBuilder(
                future: user_data.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    String name = snapshot.data["name"];
                    String email = snapshot.data["email"];
                    _addressController.text = snapshot.data["address"];
                    _phoneNoController.text = snapshot.data["phoneNumber"];
                    return Column(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          email,
                          style: Theme.of(context).textTheme.titleMedium,
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
                  } else {
                    return CustomLoadingSpinner();
                  }
                }),
            _buildTheNavigation("My Orders", DisplayScreen.routeName),
            _buildTheNavigation("Edit Profile", EditProfileScreen.routeName),
          ],
        ),
      ),
    );
  }
}
