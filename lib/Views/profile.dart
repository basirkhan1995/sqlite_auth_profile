import 'package:authentication_profile/Components/colors.dart';
import 'package:authentication_profile/Components/custom_button.dart';
import 'package:authentication_profile/Views/login.dart';
import 'package:flutter/material.dart';

import '../Json/users.dart';

class Profile extends StatelessWidget {
  final Users? users;
  const Profile({super.key, this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 67,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("assets/no_user.jpg"),
                  ),
                ),

                Text(users!.fullName??"",style: const TextStyle(fontSize: 28,color: primaryColor),),
                Text(users!.email??"",style: const TextStyle(color: Colors.grey),),
                const SizedBox(height: 15),
                Button(label: "SIGN OUT", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                }),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      ListTile(
                        leading: const Icon(Icons.person,size: 30,),
                        title: const Text("Full name"),
                        subtitle: Text(users!.fullName??""),
                      ),

                      ListTile(
                        leading: const Icon(Icons.email,size: 30,),
                        title: const Text("Email"),
                        subtitle: Text(users!.email??""),
                      ),

                      ListTile(
                        leading: const Icon(Icons.account_circle,size: 30,),
                        title: const Text("Usrename"),
                        subtitle: Text(users!.usrName??""),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
