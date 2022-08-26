import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Card(
            child: Consumer(
                builder: (context, ref, _) {
                  final state = ref.watch(authProvider);
                  if(state is AuthLoaded){
                    return ListTile(
                      title: Text(state.userModel.email ?? "default name"),
                      leading: Icon(Icons.person),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    );
                  }
                  return ListTile(
                    title: Text("Log In"),
                    leading: Icon(Icons.person),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
