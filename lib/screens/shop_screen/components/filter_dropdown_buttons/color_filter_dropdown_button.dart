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
              child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Text(
                  "Colors",
                  style: TextStyle(
                      fontFamily: "Avenir-Book",
                      color: ref.watch(colorFilterProvider).isNotEmpty ? Colors.deepPurple : Theme.of(context).hintColor,
                      fontWeight: FontWeight.bold),
                );
              },),
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
                                child: ColorFilterButtonsState(),
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


class ColorFilterButtonsState extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext consumerContext, WidgetRef ref, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  child: Center(
                    child: Text("Reset"),
                  ),
                ),
                onTap: (){
                  ref.read(colorFilterProvider.notifier).state = [];
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  child: Center(
                    child: Text("All"),
                  ),
                ),
                onTap: (){
                  ref.read(colorFilterProvider.notifier).state = ref.read(productsDataProvider.notifier).getColors().toList();
                },
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

                  Navigator.of(consumerContext).pop();


                  try{

                    await ref.read(mainFilterMethod);
                    print("this is after await");

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

