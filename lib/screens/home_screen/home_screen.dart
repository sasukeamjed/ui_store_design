import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/screens/home_screen/componenets/appbar.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';
import 'package:ui_store_design/services/data/data.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

import 'componenets/body.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = "/home";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState <HomeScreen> {
  late TextEditingController _searchController;
  late bool _isSearching;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  _stopSearching() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _isSearching = false;
      });
    }
  }

  _startSearching(){
    setState(() {
      _isSearching = true;
    });
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    _isSearching = false;
    ref.read(dataProvider.notifier).fetchRecentProducts();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_searchController.text.isEmpty) {
          setState(() {
            _isSearching = false;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AnimatedAppBar(
          stopSearchCallBack: _stopSearching,
          startSearchCallBack: _startSearching,
          searchController: _searchController,
          isSearching: _isSearching,
          scaffoldKey: _scaffoldKey,
        ),
        drawer: Drawer(
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
        ),
        body: _isSearching ?  Container(
          color: Color(0xFFededed),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text("what are you searching for..."),
          ),
        ): Body(
          stopSearchCallBack: _stopSearching,
        ),
      ),
    );
  }

}

