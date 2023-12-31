import 'package:authentication_profile/Components/colors.dart';
import 'package:authentication_profile/Components/custom_button.dart';
import 'package:authentication_profile/Components/custom_textfield.dart';
import 'package:authentication_profile/Provider/provider.dart';
import 'package:authentication_profile/Views/home.dart';
import 'package:authentication_profile/Views/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Json/users.dart';
import '../SQLite/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked  = false;
  final username = TextEditingController();
  final password = TextEditingController();
  final db = DatabaseHelper();
  bool isValid = false;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                const Text("LOGIN",style: TextStyle(color: primaryColor,fontSize: 35),),
                Image.asset("assets/background.jpg"),

                // This is how easy become when we use methods
                 InputField(label: "Username", icon: Icons.account_circle,controller: username,),

                 InputField(label: "Password", icon: Icons.lock,securePassword: true,controller: password,),

                const SizedBox(height: 2),

                Consumer<UiProvider>(
                  builder: (context,UiProvider notifier, child) {
                    return ListTile(
                          horizontalTitleGap: 2,
                          title: const Text("Remember me"),
                          leading: Checkbox(
                            activeColor: primaryColor,
                            value: notifier.isChecked,
                            onChanged: (value)=> notifier.toggleCheck(),
                          ),
                        );
                  }
                ),


                Consumer<UiProvider>(
                  builder: (context, UiProvider notifier, child) {
                    return Button(
                        label: "LOGIN",
                        onTap: ()async{

                          var result = await db.getUser(username.text);
                          var res = await db.authenticate(Users(usrName: username.text, usrPassword: password.text));
                          if(res == true){
                            if(notifier.isChecked == true){
                              //if I checked the remember me then setRemember me true,
                              //Login session become true
                              notifier.setRememberMe();
                            }
                            if(!mounted)return;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen() ));
                          } else{
                            //other wise show the message
                            setState(() {
                              isValid = true;
                            });
                          }

                        });
                  }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                    TextButton(
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                        },
                        child: const Text("SIGN UP"))
                  ],
                ),

                //When username and password is incorrect this message will appear
                isValid? const Text("username or password is incorrect",style: TextStyle(color: Colors.red),) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
