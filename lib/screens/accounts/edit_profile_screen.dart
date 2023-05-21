import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/widgets/accounts/customdecorationforaccountinput.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
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
  final _phoneNoController = TextEditingController();
  final _addressController = TextEditingController();
  String _imageUrl = "";
  var prefeb;
  bool init = false;

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
      style: Theme.of(context).textTheme.titleSmall,
      decoration: customDecorationForAccountInput(
        context,
        inputTextlabel,
        Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    final userData = ModalRoute.of(context)!.settings.arguments as Map;
    final navigationVar = Navigator.of(context);
    if (!init) {
      _nameController.text = userData["name"].toString();
      //_emailTextController.text = userData["email"].toString();
      _phoneNoController.text = userData["phoneNumber"].toString();
      _addressController.text = userData["address"].toString();
      _imageUrl = userData["imageUrl"];
      init = true;
    }
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
                screenToBeRendered: "None", // change afterwards
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(_imageUrl),
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
                          onPressed: () async {
                            //Start CircularProgressIndicator
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomLoadingSpinner();
                              },
                            );

                            await user_data.updateData(
                                _nameController.text,
                                _addressController.text,
                                _phoneNoController.text);
                            navigationVar.pop();
                            navigationVar.pop();
                            navigationVar.pop();
                            navigationVar.pushNamed(AccountScreen.routeName,
                                arguments: {"reload": true});
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
