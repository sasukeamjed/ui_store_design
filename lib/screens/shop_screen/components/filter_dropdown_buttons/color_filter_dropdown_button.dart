import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/colors_library/string_color_genrator.dart';
import 'package:ui_store_design/models/product_model.dart';

import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/providers/filter_provider.dart';

class ColorFilterDropDownButton extends ConsumerStatefulWidget {
  const ColorFilterDropDownButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorFilterDropDownButton> createState() =>
      _ColorFilterDropDownButtonState();
}

class _ColorFilterDropDownButtonState extends ConsumerState<ColorFilterDropDownButton> {
  @override
  Widget build(BuildContext context) {
    final Set<String> colors =
        ref.read(productsDataProvider.notifier).getColors();
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
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close, color: Colors.white,),
                          ),
                        ),
                      ),
                      Center(child: Text("Colors Picked: 3")),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void openFilterDialog(Set<String> colorsNames) async {
    List<String> selectedColors = [];

    await FilterListDialog.display<String>(
      context,
      listData: colorsNames.toList(),
      selectedListData: selectedColors,
      // selectedListData: ref.read(colorFilterProvider).toSet().toList(),
      choiceChipLabel: (color) => color,
      validateSelectedItem: (list, val) {
        // print("this is the list => $list");
        // print("this is the provider list => ${ref.read(colorFilterProvider)}");
        return ref.read(colorFilterProvider).contains(val) || list!.contains(val);
      },
      onItemSearch: (color, query) {
        return color.toLowerCase().contains(query.toLowerCase());
      },
      choiceChipBuilder: (context, colorName, isClicked) {
        if(isClicked != null){
          if(isClicked){
            // print("$colorName filter is clicked selected colors");
            // print("$selectedColors this is selected colors");
            // print("${ref.read(colorFilterProvider)} Selected Colors before condition");
            // print("${ref.read(colorFilterProvider).contains(colorName)} color condition");
            // if(ref.read(colorFilterProvider).contains(colorName)){

              if(!ref.read(colorFilterProvider).contains(colorName)){
                ref.read(colorFilterProvider).add(colorName);
              }



            // }else{

            // }
            // //
            // print("${ref.read(colorFilterProvider)} Selected Colors after condition");
          }else{
            // print("color is in the list removing a color");
            // selectedColors.remove(colorName);
            ref.read(colorFilterProvider).remove(colorName);

          }

        }
        print("=====================================================");
        print("this $colorName is clicked => $isClicked");
        print("this is the list => ${ref.read(colorFilterProvider)}");

        print("this the selected colors is in the list => ${ref.read(colorFilterProvider)}");
        // print("=====================================================");



        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
              height: 30,
              width: 50,
              child: Center(
                child: Text(
                  colorName.toString(),
                ),
              ),
              decoration: BoxDecoration(
                color: getColorHexFromName(colorName),
                borderRadius: BorderRadius.circular(20),

                border: ref.watch(colorFilterProvider).contains(colorName) ? Border.all(color: Colors.orange.shade300, width: 2) : isClicked! ? Border.all(color: Colors.orange.shade300, width: 2) : null,
                // border: ref.watch(colorFilterProvider).contains(colorName)
                //     ? Border.all(color: Colors.orange.shade300, width: 2)
                //     : null,
              ),
            ),
            if(isClicked != null)
              if (isClicked)
                Icon(
                  Icons.close,
                  color: Colors.orange.shade300,
                  size: 10,
                ),
          ],
        );
      },
      onApplyButtonClick: (list) async {
        Navigator.pop(context);
        // setState(() {
        //   selectedColors = List.from(list!);
        // });
        ref.read(colorFilterProvider.notifier).update((state) => selectedColors);
        ref.read(shopScreenLoadingDataState.notifier).state = true;

        List<Product>? products = await ref.read(mainFilterMethod);
        ref.read(productsProvider.notifier).state = products!;
        ref.read(shopScreenLoadingDataState.notifier).state = false;
      },
    );
  }


}
