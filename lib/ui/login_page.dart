import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/provider/google_sign_in_provider.dart';
import 'package:todoer_app/ui/logged_in_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> performLogin(String provider, List<String> scopes,
    //     Map<String, String> parameters) async {
    //   try {
    //     await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    //   } on PlatformException catch (error) {
    //     debugPrint("oooooops ${error.code}: ${error.message}");
    //   }
    //   Navigator.of(context).pushNamed('/home');
    //
    // }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Text(
                "Welcome to Microsoft TODO",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade700
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "email or phone number",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                label: Text('Sign up with Google'),
                onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                  Navigator.push(context,   MaterialPageRoute (
                    builder: (BuildContext context) => LoggedInCheckPage(),
                  ),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// onTap: () async {
// await performLogin("microsoft.com", [
// "kalyanideshmukh002@gmail.com"
// ], {
// 'tenant': 'f8cdef31-a31e-4b4a-93e4-5f571e91255a'
// });
// },