import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/widgets/accounts/customdecorationforaccountinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';

import '../../providers/user_data_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const routeName = '/editProfile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildTextFormField(
    TextEditingController myController,
    TextInputType textType,
    String inputTextlabel,
  ) {
    return TextFormField(
      controller: myController,
      minLines: 1,
      maxLines: 2,
      keyboardType: textType,
      decoration: customDecorationForAccountInput(
        context,
        inputTextlabel,
        Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    _nameController.text = user_data.name;
    _emailTextController.text = user_data.email;
    _phoneNoController.text = user_data.number;
    _addressController.text = user_data.address;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: MyCustomScreen(
          customColor: Theme.of(context).primaryColor,
          screenContent: Column(
            children: [
              const HeaderWithNavigation(
                heading: "Edit Profile",
                screenToBeRendered: "None",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      //TextFormField
                      _buildTextFormField(
                        _nameController,
                        TextInputType.name,
                        "Name",
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //TextFormField
                      _buildTextFormField(
                        _emailTextController,
                        TextInputType.emailAddress,
                        "Email",
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //TextFormField
                      _buildTextFormField(
                        _phoneNoController,
                        TextInputType.number,
                        "Phone Number",
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //TextFormField
                      _buildTextFormField(
                        _addressController,
                        TextInputType.multiline,
                        "Address",
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.07),
                        child: ElevatedButton(
                          onPressed: () {
                            print(_nameController.text);
                            print(_emailTextController.text);
                            print(_phoneNoController.text);
                            print(_addressController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              size.width * 0.8,
                              size.height * 0.06,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
