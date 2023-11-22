import 'package:authentication_profile/Components/colors.dart';
import 'package:authentication_profile/Components/custom_button.dart';
import 'package:authentication_profile/Views/login.dart';
import 'package:authentication_profile/Views/signup.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

           const Column(
             children: [

               SizedBox(height: 20),
               Text("Authentication",style: TextStyle(color: primaryColor,fontSize: 35),),
               Text("Authentication to secure vital information",style: TextStyle(color: Colors.grey),),
             ],
           ),


              Expanded(
                  child: Image.asset("assets/startup.jpg")),


              Button(
                  label: "LOGIN",
                  onTap: (){
                    //Goto login
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  }),

              const SizedBox(height: 10),

              Button(
                  label: "SIGN UP",
                  onTap: (){
                    //Goto Sign up
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                  }),


              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }
}
