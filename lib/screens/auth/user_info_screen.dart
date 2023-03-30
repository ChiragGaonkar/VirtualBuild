import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/customdecorationforinput.dart';
import '../../widgets/customloadingspinner.dart';
import '../../widgets/customsnackbar.dart';
import 'package:http/http.dart' as http;

import 'otp_screen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});
  static const routeName = "/userInfo";

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String localOTP = "";

  Future<String> sendOtp(String userEmail) async {
    var url = Uri.http("10.0.2.2:5000", "/generate_otp/$userEmail");
    Response response = await http.get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var scaffoldMessengerVar = ScaffoldMessenger.of(context);
    var navigatorVar = Navigator.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: MyCustomScreen(
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(heading: "Personal Info"),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        TextFormField(
                          enabled: false,
                          decoration: customDecorationForInput(
                            context,
                            args['email'],
                            Icons.email_rounded,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          controller: _nameTextController,
                          decoration: customDecorationForInput(
                            context,
                            "Enter Name",
                            Icons.person_2_rounded,
                          ),
                          validator: (name) {
                            if (name != null && name.isEmpty) {
                              return "Enter a valid name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: customDecorationForInput(
                            context,
                            "Enter Phone Number",
                            Icons.phone_android_rounded,
                          ),
                          validator: (phoneNumber) {
                            if (phoneNumber != null &&
                                    phoneNumber.length < 10 ||
                                phoneNumber!.length > 10) {
                              return "Enter a valid phone number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: customDecorationForInput(
                            context,
                            "Enter address",
                            Icons.house_rounded,
                          ),
                          minLines: 1,
                          maxLines: 5,
                          enableSuggestions: true,
                          validator: (address) {
                            if (address != null && address.isEmpty) {
                              return "Enter a valid address";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        NextButtonClass(
                          text: "Proceed to Verify",
                          onPressed: () async {
                            //Check for the fields are valid in TextFormField.
                            final isValid = formKey.currentState!.validate();
                            if (!isValid) return;

                            //Hides the keyboard.
                            FocusScope.of(context).unfocus();

                            //Start CircularProgressIndicator
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomLoadingSpinner();
                              },
                            );

                            //Send OTP to the user
                            localOTP = await sendOtp(args['email']);

                            navigatorVar.pop();

                            if (localOTP != "") {
                              //Navigate to OTP Screen for verification.
                              scaffoldMessengerVar.showSnackBar(
                                const SnackBar(
                                  content: CustomSnackBar(
                                    messageToBePrinted: "OTP sent successfully",
                                    bgColor: Color.fromRGBO(44, 199, 142, 1),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );

                              navigatorVar.pushNamed(
                                OTPScreen.routeName,
                                arguments: {
                                  'email': args['email'],
                                  'password': args['password'],
                                  'name': _nameTextController.text,
                                  'phoneNumber': _phoneNumberController.text,
                                  'address': _addressController.text,
                                  'localOTP': localOTP,
                                },
                              );
                            } else {
                              scaffoldMessengerVar.showSnackBar(
                                const SnackBar(
                                  content: CustomSnackBar(
                                    messageToBePrinted: "Failed to send OTP",
                                    bgColor: Color.fromRGBO(199, 44, 65, 1),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
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
