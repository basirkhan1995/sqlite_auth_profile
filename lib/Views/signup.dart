import 'package:authentication_profile/Components/colors.dart';
import 'package:authentication_profile/Components/custom_button.dart';
import 'package:authentication_profile/Components/custom_textfield.dart';
import 'package:authentication_profile/Json/users.dart';
import 'package:authentication_profile/Views/login.dart';
import 'package:flutter/material.dart';

import '../SQLite/database_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPass = TextEditingController();
  final db = DatabaseHelper();
  //TextEditing controllers gets the value from textfield and pass it to database by functions we have
  //already created in databasehelper class
  signUp()async{
    var res = await db.createUser(Users( fullName: fullName.text, email: email.text, usrName: username.text, usrPassword: password.text));
    if(res>0){
      if(!mounted)return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Register New Account",style: TextStyle(fontSize: 60,color: primaryColor,fontWeight: FontWeight.bold),),
              ),

                InputField(label: "Full name", icon: Icons.person,controller: fullName,),
                InputField(label: "Email", icon: Icons.email,controller: email,),
                InputField(label: "Username", icon: Icons.account_circle,controller: username,),
                InputField(label: "Password", icon: Icons.lock,controller: password,securePassword: true,),
                InputField(label: "Re-enter password", icon: Icons.lock,controller: confirmPass,securePassword: true,),

              const SizedBox(height: 10),
              Button(label: "SIGN UP", onTap: (){

                signUp();
              }),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style: TextStyle(color: Colors.grey),),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: const Text("LOGIN"))
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
