import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:omar_mostafa/apis/apis.dart';
import 'package:omar_mostafa/helpers/colors.dart';
import 'package:omar_mostafa/helpers/dialogs.dart';
import 'package:omar_mostafa/helpers/shared_data.dart';
import 'package:omar_mostafa/provider/internet_provider.dart';
import 'package:omar_mostafa/provider/sign_in_provider.dart';
import 'package:omar_mostafa/screens/auth/complete_user_data.dart';
import 'package:omar_mostafa/screens/auth/phoneauth_screen.dart';
import 'package:omar_mostafa/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
  }

  _handleGoogleButtonClick() {
    _signInWithGoogle().then((user) async {
      if (user != null) {
        googleController.success();
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
        if ((await APIs.userExists())) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          var retrievedUser = await APIs.getFutureOfUserById(APIs.user.uid);
          SharedData.user = retrievedUser;
        } else {
          await APIs.createUser().then((value) async {
            var retrievedUser = await APIs.getFutureOfUserById(APIs.user.uid);
            SharedData.user = retrievedUser;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CompleteUserData(_isStudent, false)));
          });
        }
      }
      googleController.reset();
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, '!حدث خطأ ما');
      return null;
    }
  }

  bool _isStudent = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/designed_background.jpg'))),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Column(children: [
          SizedBox(width: double.infinity, height: height * .11),
          Image.asset('assets/images/logo.png'),
          SizedBox(height: height * .11),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * .021),
            height: height * .07,
            width: width * .85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * .039),
              boxShadow: [
                BoxShadow(
                  color: lightGreen.withOpacity(0.17),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isStudent = false;
                    });
                  },
                  child: Container(
                    width: width * .39,
                    height: height * .05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .039),
                        color: _isStudent ? Colors.white : darkGreen),
                    child: Center(
                        child: Text('ولي أمر',
                            style: TextStyle(
                                color: _isStudent ? textGrey : Colors.white,
                                fontFamily: 'cairo'))),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isStudent = true;
                    });
                  },
                  child: Container(
                    width: width * .39,
                    height: height * .05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .039),
                        color: _isStudent ? darkGreen : Colors.white),
                    child: Center(
                      child: Text(
                        'طالب',
                        style: TextStyle(
                            color: _isStudent ? Colors.white : textGrey,
                            fontFamily: 'cairo'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: height * .11),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * .05),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: lightGreen.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الخاصة بنا',
                      style: TextStyle(
                          fontFamily: 'cairo', fontSize: width * .027),
                    ),
                    SizedBox(
                      width: width * .01,
                    ),
                    Text(
                      'شروط الخدمات و سياسة الخصوصية',
                      style: TextStyle(
                          fontFamily: 'cairo',
                          color: lightGreen,
                          fontSize: width * .027),
                    ),
                    SizedBox(
                      width: width * .01,
                    ),
                    Text(
                      'موافق على',
                      style: TextStyle(
                          fontFamily: 'cairo', fontSize: width * .027),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width),
                          color: lightGreen,
                        ),
                        child: Image.asset(
                          'assets/images/Check.png',
                          width: width * .075,
                        )),
                    SizedBox(
                      width: width * .03,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * .081),
          RoundedLoadingButton(
              borderRadius: width * .039,
              height: height * .05,
              width: width * .85,
              color: lightGreen,
              successColor: lightGreen,
              controller: googleController,
              onPressed: () {
                //handleGoogleSignIn();
                _handleGoogleButtonClick();
              },
              child: Wrap(
                children: [
                  const Icon(FontAwesomeIcons.google),
                  SizedBox(
                    width: width * .05,
                  ),
                  const Text('متابعة التسجيل بجوجل',
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white))
                ],
              )),
          SizedBox(height: height * .039),
          RoundedLoadingButton(
              borderRadius: width * .039,
              height: height * .05,
              width: width * .85,
              color: lightGreen,
              successColor: lightGreen,
              controller: facebookController,
              onPressed: () {
                handleFacebookAuth();
              },
              child: Wrap(
                children: [
                  const Icon(FontAwesomeIcons.facebook),
                  SizedBox(
                    width: width * .05,
                  ),
                  const Text('متابعة التسجيل بفيسبوك',
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white))
                ],
              )),
          SizedBox(height: height * .039),
          RoundedLoadingButton(
              borderRadius: width * .039,
              height: height * .05,
              width: width * .85,
              color: lightGreen,
              successColor: lightGreen,
              controller: twitterController,
              onPressed: () {
                handleTwitterAuth();
              },
              child: Wrap(
                children: [
                  const Icon(FontAwesomeIcons.twitter),
                  SizedBox(
                    width: width * .05,
                  ),
                  const Text('متابعة التسجيل بتويتر',
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white))
                ],
              )),
          SizedBox(height: height * .039),
          RoundedLoadingButton(
              borderRadius: width * .039,
              height: height * .05,
              width: width * .85,
              color: lightGreen,
              successColor: lightGreen,
              controller: phoneController,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PhoneAuthScreen(_isStudent)));
                phoneController.reset();
              },
              child: Wrap(
                children: [
                  const Icon(FontAwesomeIcons.phone),
                  SizedBox(
                    width: width * .05,
                  ),
                  const Text('متابعة التسجيل برقم الموبايل',
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white))
                ],
              ))
        ]),
      ),
    );
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();
    if (ip.hasInternet == false) {
      Dialogs.showSnackbar(context, "تأكد من الاتصال بالانترنت");
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          Dialogs.showSnackbar(context, sp.errorCode.toString());
          googleController.reset();
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn(false);
                      })));
            } else {
              sp.saveDataToFireStore(_isStudent).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn(true);
                      })));
            }
          });
        }
      });
    }
  }

  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();
    if (ip.hasInternet == false) {
      Dialogs.showSnackbar(context, "تأكد من الاتصال بالانترنت");
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          Dialogs.showSnackbar(context, sp.errorCode.toString());
          facebookController.reset();
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn(false);
                      })));
            } else {
              sp.saveDataToFireStore(_isStudent).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn(true);
                      })));
            }
          });
        }
      });
    }
    Future.delayed(const Duration(seconds: 3));
    facebookController.reset();
  }

  Future handleTwitterAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();
    if (ip.hasInternet == false) {
      Dialogs.showSnackbar(context, "تأكد من الاتصال بالانترنت");
      googleController.reset();
    } else {
      await sp.signInWithTwitter().then((value) {
        if (sp.hasError == true) {
          Dialogs.showSnackbar(context, sp.errorCode.toString());
          twitterController.reset();
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        twitterController.success();
                        handleAfterSignIn(false);
                      })));
            } else {
              sp.saveDataToFireStore(_isStudent).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        twitterController.success();
                        handleAfterSignIn(true);
                      })));
            }
          });
        }
      });
    }
  }

  handleAfterSignIn(bool newUser) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      newUser == true
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CompleteUserData(_isStudent, false)))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }
}
