import 'package:email_auth/email_auth.dart';

class OTPVerification {
  EmailAuth emailAuth = EmailAuth(sessionName: "for Forget Password");

  void sendOTP(String email) async {
    bool response = await emailAuth.sendOtp(
      recipientMail: email,
      otpLength: 5,
    );
    if (response) {
      print("OTP sent successfully");
    } else {
      print("OTP failed to be sent");
    }
  }

  Future<bool> validateOTP(String email, String otp) async {
    bool response = emailAuth.validateOtp(
      recipientMail: email,
      userOtp: otp,
    );
    if (response) {
      return true;
    } else {
      return false;
    }
  }
  
}
