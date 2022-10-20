import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/home_screen/componenets/appbar.dart';
import 'package:ui_store_design/screens/home_screen/componenets/home_drawer.dart';
import 'package:ui_store_design/screens/home_screen/componenets/searching_page.dart';
import 'package:ui_store_design/screens/home_screen/componenets/searching_page2.dart';
import 'package:ui_store_design/services/data/data.dart';


import 'componenets/body.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = "/home";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState <HomeScreen> {
  late TextEditingController _searchController;
  late bool _isSearching;
  // late String _searchValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // _getSearchValue(String search){
  //   setState(() {
  //     _searchValue = search;
  //   });
  // }

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
    // _searchValue = "";
    _isSearching = false;
    ref.read(dataProvider.notifier).sortProductsByDate();
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
      //Wraped the whole Scaffold in GestureDetector to remove the search TextField keyboard
      //and check if Search TextField is empty or not if it is empty then we will set the _isSearching variable to false
      //and then will return to home page
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
        appBar: ChangableAppBar(
          stopSearchCallBack: _stopSearching,
          startSearchCallBack: _startSearching,
          // searchFunction: _getSearchValue,
          searchController: _searchController,
          isSearching: _isSearching,
          scaffoldKey: _scaffoldKey,
        ),
        drawer: HomeDrawer(),
        //Here we check for _isSearching if it is true we will return The Search page which
        //it is just a Container and if it is False we will return the body.
        // body: _isSearching ?  SearchPage(): Body(
        //   stopSearchCallBack: _stopSearching,
        // ),
        body: Body(stopSearchCallBack: _stopSearching,),
      ),
    );
  }

}

