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
                // style: Theme.of(context)
                //     .textTheme
                //     .titleMedium
                //     ?.copyWith(
                //         color: Theme.of(context).hintColor),
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
        _showSimpleDialog(context);
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

  Future<void> _showSimpleDialog(BuildContext context) async {

    print("this is the build context value => ${scaffoldKey.currentContext}");

    await showDialog<void>(
        context: scaffoldKey.currentContext!,
        builder: (BuildContext dialogContext) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                                Navigator.of(context).pop();
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
                                        // ElevatedButton(
                                        //   child: Text("Apply"),
                                        //   onPressed: () {},
                                        //   style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.lightBlueAccent,
                                        //   ),
                                        // ),
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
                                              print("this is the Scaffold Context value p1 => ${scaffoldKey.currentContext}");
                                              print("this is the context value p2 => ${context}");
                                              print("this is the dailogContext value p3 => ${dialogContext}");

                                              ref.read(shopScreenLoadingDataState.notifier).state = true;

                                              Navigator.of(dialogContext, rootNavigator: true).pop('dialog');

                                              List<Product>? products = await ref.read(mainFilterMethod);

                                              print("this is the Scaffold Context value A1 => ${scaffoldKey.currentContext}");
                                              print("this is the context value A2 => ${context}");
                                              print("this is the dailogContext value A3 => ${dialogContext}");

                                              ref.read(productsProvider.notifier).state = products!;
                                              ref.read(shopScreenLoadingDataState.notifier).state = false;
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

  // void openFilterDialog(Set<String> colorsNames) async {
  //   List<String> selectedColors = [];
  //
  //   await FilterListDialog.display<String>(
  //     context,
  //     listData: colorsNames.toList(),
  //     selectedListData: selectedColors,
  //     hideSearchField: true,
  //     // selectedListData: ref.read(colorFilterProvider).toSet().toList(),
  //     choiceChipLabel: (color) => color,
  //     validateSelectedItem: (list, val) {
  //       // print("this is the list => $list");
  //       // print("this is the provider list => ${ref.read(colorFilterProvider)}");
  //       return ref.read(colorFilterProvider).contains(val) ||
  //           list!.contains(val);
  //     },
  //     onItemSearch: (color, query) {
  //       return color.toLowerCase().contains(query.toLowerCase());
  //     },
  //     choiceChipBuilder: (context, colorName, isClicked) {
  //       if (isClicked != null) {
  //         if (isClicked) {
  //           // print("$colorName filter is clicked selected colors");
  //           // print("$selectedColors this is selected colors");
  //           // print("${ref.read(colorFilterProvider)} Selected Colors before condition");
  //           // print("${ref.read(colorFilterProvider).contains(colorName)} color condition");
  //           // if(ref.read(colorFilterProvider).contains(colorName)){
  //
  //           if (!ref.read(colorFilterProvider).contains(colorName)) {
  //             ref.read(colorFilterProvider).add(colorName);
  //           }
  //
  //           // }else{
  //
  //           // }
  //           // //
  //           // print("${ref.read(colorFilterProvider)} Selected Colors after condition");
  //         } else {
  //           // print("color is in the list removing a color");
  //           // selectedColors.remove(colorName);
  //           ref.read(colorFilterProvider).remove(colorName);
  //         }
  //       }
  //       print("=====================================================");
  //       print("this $colorName is clicked => $isClicked");
  //       print("this is the list => ${ref.read(colorFilterProvider)}");
  //
  //       print(
  //           "this the selected colors is in the list => ${ref.read(colorFilterProvider)}");
  //       // print("=====================================================");
  //
  //       return Stack(
  //         clipBehavior: Clip.none,
  //         alignment: Alignment.topRight,
  //         children: [
  //           Container(
  //             margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
  //             height: 30,
  //             width: 50,
  //             child: Center(
  //               child: Text(
  //                 colorName.toString(),
  //               ),
  //             ),
  //             decoration: BoxDecoration(
  //               color: getColorHexFromName(colorName),
  //               borderRadius: BorderRadius.circular(20),
  //
  //               border: ref.watch(colorFilterProvider).contains(colorName)
  //                   ? Border.all(color: Colors.orange.shade300, width: 2)
  //                   : isClicked!
  //                       ? Border.all(color: Colors.orange.shade300, width: 2)
  //                       : null,
  //               // border: ref.watch(colorFilterProvider).contains(colorName)
  //               //     ? Border.all(color: Colors.orange.shade300, width: 2)
  //               //     : null,
  //             ),
  //           ),
  //           if (isClicked != null)
  //             if (isClicked)
  //               Icon(
  //                 Icons.close,
  //                 color: Colors.orange.shade300,
  //                 size: 10,
  //               ),
  //         ],
  //       );
  //     },
  //     onApplyButtonClick: (list) async {
  //       Navigator.pop(context);
  //       // setState(() {
  //       //   selectedColors = List.from(list!);
  //       // });
  //       ref.read(colorFilterProvider.notifier).update((state) => selectedColors);
  //       ref.read(shopScreenLoadingDataState.notifier).state = true;
  //
  //       List<Product>? products = await ref.read(mainFilterMethod);
  //       ref.read(productsProvider.notifier).state = products!;
  //       ref.read(shopScreenLoadingDataState.notifier).state = false;
  //     },
  //   );
  // }
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

