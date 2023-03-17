import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/screens/accounts/edit_profile_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/widgets/accounts/customdecorationforaccountinput.dart';
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

class _AccountScreenState extends State<AccountScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

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
  void initState() {
    super.initState();
    // setState(() {
    //   _addressController.text =
    //       "E2, Flat G3, Chamunda Enclave, Santa Cruz, Goa";
    //   _phoneNoController.text = "9527892142";
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    _addressController.text = user_data.address;
    _phoneNoController.text = user_data.number;
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
            Text(
              user_data.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              user_data.email,
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
            _buildTheNavigation("My Orders", DisplayScreen.routeName),
            _buildTheNavigation("Edit Profile", EditProfileScreen.routeName),
          ],
        ),
      ),
    );
  }
}
