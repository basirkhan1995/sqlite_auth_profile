import 'package:authentication_profile/Components/custom_button.dart';
import 'package:authentication_profile/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UiProvider>(
              builder: (context,UiProvider notifier,child) {
                return Button(label: "SIGN OUT", onTap: (){
                  notifier.logout(context);
                });
              }
            )
          ],
        ),
      ),
    );
  }
}
