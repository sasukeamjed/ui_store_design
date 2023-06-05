import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/colors_library/string_color_genrator.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/product_model.dart';

import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/providers/filter_provider.dart';



class ColorFilterDropDownButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ColorFilterDropDownButton({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Colors",
                style: TextStyle(
                    fontFamily: "Avenir-Book",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Spacer(),
          Icon(
            Icons.arrow_downward,
            color: Theme.of(context).hintColor,
          ),
        ],
      ),
      onPressed: () {
        // openFilterDelegate(context, colors);
        // openFilterDialog(colors);
        _showSimpleDialog(context, scaffoldKey);
      },
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Colors.transparent),
          surfaceTintColor: Colors.green,
          shadowColor: Colors.green,
          foregroundColor: Colors.grey
          // foregroundColor: Colors.black,
          ),
    );
    ;
  }



  Future<void> _showSimpleDialog(BuildContext ancestorContext, GlobalKey<ScaffoldState> scaffoldKey) async {

    // print("this is the build context value => ${scaffoldKey.currentContext}");



    await showDialog<void>(
        context: scaffoldKey.currentContext!,
        builder: (BuildContext builderContext) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: MediaQuery.of(ancestorContext).size.height * 0.5,
              width: MediaQuery.of(ancestorContext).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(ancestorContext).size.width,
                        height: MediaQuery.of(ancestorContext).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Icon(
                                CupertinoIcons.clear_circled,
                                color: Colors.grey,
                                size: 30.w,
                              ),
                              onTap: () {
                                Navigator.of(builderContext).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            return Text(
                              "Colors Picked: ${ref.watch(colorFilterProvider).length}",
                              style: TextStyle(fontSize: 13.sp),
                            );
                          },),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            ColorsGridFilter(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h, right: 20.w, left: 20.w),
                                height: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Consumer(
                                  builder: (BuildContext consumerContext, WidgetRef ref, Widget? child) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: double.infinity,
                                            child: Center(
                                              child: Text("Reset"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: double.infinity,
                                            child: Center(
                                              child: Text("All"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            child: Container(
                                              height: double.infinity,
                                              child: Center(
                                                child: Text("Apply"),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.lightBlueAccent,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            onTap: () async{


                                              ref.read(shopScreenLoadingDataState.notifier).state = true;

                                              // if(ancestorContext.mounted){
                                              //   print("ancestor context is mounted");
                                              // }else{
                                              //   print("ancestor context is not mounted");
                                              // }
                                              // if(builderContext.mounted){
                                              //   print("builder context is mounted");
                                              // }else{
                                              //   print("builder context is not mounted");
                                              // }
                                              // if(consumerContext.mounted){
                                              //   print("consumer context is mounted");
                                              // }else{
                                              //   print("consumer context is not mounted");
                                              // }

                                              Navigator.of(scaffoldKey.currentContext!).pop();


                                              // if(ancestorContext.mounted){
                                              //   print("After ancestor context is mounted");
                                              // }else{
                                              //   print("After ancestor context is not mounted");
                                              // }
                                              // if(builderContext.mounted){
                                              //   print("After builder context is mounted");
                                              // }else{
                                              //   print("After builder context is not mounted");
                                              // }
                                              // if(consumerContext.mounted){
                                              //   print("After consumer context is mounted");
                                              // }else{
                                              //   print("After consumer context is not mounted");
                                              // }


                                              try{

                                                await ref.read(mainFilterMethod);
                                                print("this is after await");

                                                // ref.read(productsProvider.notifier).state = products!;
                                                // ref.read(shopScreenLoadingDataState.notifier).state = false;
                                              }catch(e){
                                                // if(ancestorContext.mounted){
                                                //   print("After in error ancestor context is mounted");
                                                // }else{
                                                //   print("After in error ancestor context is not mounted");
                                                // }
                                                // if(builderContext.mounted){
                                                //   print("After in error builder context is mounted");
                                                // }else{
                                                //   print("After in error builder context is not mounted");
                                                // }
                                                // if(consumerContext.mounted){
                                                //   print("After in error consumer context is mounted");
                                                // }else{
                                                //   print("After in error consumer context is not mounted");
                                                // }
                                                print("here is the color filter error => $e");
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

}

class ColorFilterButtons extends StatefulWidget {
  const ColorFilterButtons({Key? key}) : super(key: key);

  @override
  State<ColorFilterButtons> createState() => _ColorFilterButtonsState();
}

class _ColorFilterButtonsState extends State<ColorFilterButtons> {

  late NavigatorState _navigatorState;

  @override
  void didChangeDependencies() {
    _navigatorState = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Center(
                  child: Text("Reset"),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Center(
                  child: Text("All"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: Text("Apply"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () async{

                  // try{
                  //
                  // }catch(e){
                  //
                  // }
                  // print("this is the Scaffold Context value p1 => ${scaffoldKey.currentContext}");
                  // print("this is the context value p2 => ${context}");
                  // print("this is the dailogContext value p3 => ${dialogContext}");

                  ref.read(shopScreenLoadingDataState.notifier).state = true;

                  Navigator.of(_navigatorState.context, rootNavigator: true).pop('dialog');


                  try{
                    // List<Product>? products = await ref.read(mainFilterMethod);

                    // print("this is the Scaffold Context value A1 => ${scaffoldKey.currentContext}");
                    // print("this is the context value A2 => ${context}");
                    // print("this is the dailogContext value A3 => ${dialogContext}");

                    // ref.read(productsProvider.notifier).state = products!;
                    ref.read(shopScreenLoadingDataState.notifier).state = false;
                  }catch(e){
                    print("here is the color filter error => $e");
                  }
                },
              ),
            ),
          ],
        );
      },);
  }


}


class ColorsGridFilter extends ConsumerWidget {
  ColorsGridFilter({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, ref) {

    final addColors = [...ref.read(productsDataProvider.notifier).getColors()];

    return FadingEdgeScrollView.fromScrollView(
      child: GridView.count(
        controller: _controller,
        crossAxisCount: 3,
        childAspectRatio: 2.0,
        // clipBehavior: C,
        padding: EdgeInsets.only(bottom: 100.h, top: 10.h),
        children: List.generate(addColors.length, (index) {
          return GestureDetector(
            onTap: (){

              if(ref.read(colorFilterProvider.notifier).state.contains(addColors[index])){
                final List<String> filterdColors = ref.read(colorFilterProvider);
                filterdColors.remove(addColors[index]);
                ref.read(colorFilterProvider.notifier).state = [...filterdColors];
              }else{
                ref.read(colorFilterProvider.notifier).state = [addColors[index], ...ref.read(colorFilterProvider.notifier).state];
              }
              // print("provider Lists colors => ${ref.read(colorFilterProvider)}");
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  // height: 30,
                  // width: 50,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(addColors[index].toString().capitalize(),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: getColorHexFromName(addColors[index]),
                    borderRadius: BorderRadius.circular(20),
                    border: ref.watch(colorFilterProvider).contains(addColors[index])
                        ? Border.all(color: Colors.orange.shade300, width: 2) : null,
                  ),
                ),
                if(ref.watch(colorFilterProvider).contains(addColors[index]))
                  Icon(
                    Icons.close,
                    color: Colors.orange.shade300,
                    size: 10,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

