import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/screens/accounts/account_screen.dart';
import 'package:virtualbuild/screens/auth/home_screen.dart';
import 'package:virtualbuild/widgets/accounts/customdecorationforaccountinput.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';
import '../../firebase/firestore_database.dart';
import '../../providers/user_data_provider.dart';
import '../display_screen.dart';
import '../error_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const routeName = '/editProfile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
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
    String? Function(String?) validator,
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
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffoldMessengerVar = ScaffoldMessenger.of(context);
    bool isErrorOccured = false;
    var user_data = Provider.of<UserDataProvide>(context, listen: false);
    final navigationVar = Navigator.of(context);
    try {
      final userData = ModalRoute.of(context)!.settings.arguments as Map;
      if (!init) {
        _nameController.text = userData["name"].toString();
        //_emailTextController.text = userData["email"].toString();
        _phoneNoController.text = userData["phoneNumber"].toString();
        _addressController.text = userData["address"].toString();
        _imageUrl = userData["imageUrl"];
        print("image $_imageUrl");
        init = true;
      }
    } catch (e) {
      isErrorOccured = true;
    }
    return isErrorOccured
        ? const ErrorScreen(screenToBeRendered: DisplayScreen.routeName, renderScreenName: "Home Page")
        : Scaffold(
            // resizeToAvoidBottomInset: true,
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print("gesture");
                                  await user_data.uploadDP();
                                  // setState(() {});
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(_imageUrl),
                                  radius: 80,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              //TextFormField
                              _buildTextFormField(
                                _nameController,
                                TextInputType.name,
                                "Name",
                                (value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value!)) {
                                    return 'Please enter alphabets only(spaces allowed)';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              //TextFormField
                              _buildTextFormField(
                                _phoneNoController,
                                TextInputType.number,
                                "Phone Number",
                                (value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please enter your phone number";
                                  }
                                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                                    return "Phone number should only contain 10 digits";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              //TextFormField
                              _buildTextFormField(
                                _addressController,
                                TextInputType.multiline,
                                "Address",
                                (value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please enter a valid address";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.07),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final isValid = formKey.currentState!.validate();
                                    if (!isValid) return;
                                    FocusScope.of(context).unfocus();
                                    //Start CircularProgressIndicator
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const CustomLoadingSpinner();
                                      },
                                    );

                                    await user_data.updateData(_nameController.text, _addressController.text, _phoneNoController.text);
                                    navigationVar.pop();
                                    navigationVar.pop();
                                    navigationVar.pop();
                                    navigationVar.pushNamed(AccountScreen.routeName, arguments: {"reload": true});
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
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
