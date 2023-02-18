import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/screens/profile_screen/profile_screen.dart';
import 'package:ui_store_design/screens/shop_screen/shop_screen.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //The consumer is the top level widget, and it is the one which
      //decides which ListView returns User Logged In ListView or User not logged In ListView
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(authProvider);
              return state is AuthLoaded ? ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: ListTile(
                      title: Text(state.userModel.email ?? "default name"),
                      leading: Icon(Icons.person),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout_rounded),
                      onTap: (){
                        ref.read(authProvider.notifier).logOut();
                      },
                    ),
                  ),
                ],
              ):ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: ListTile(
                      title: Text("Log In"),
                      leading: Icon(Icons.login),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    ),
                  ),
                ],
              );
            }
          ),
          Card(
            child: ListTile(
              title: Text("Shop"),
              leading: Icon(Icons.logout_rounded),
              onTap: (){
                Navigator.of(context).pushNamed(ShopScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
