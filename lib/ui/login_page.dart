import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(
                  onPressed: (){},
                  child: InkWell(
                      child: Text("Sign in"),
                    onTap: (){
                        Navigator.pushNamed(context,'/home');
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
