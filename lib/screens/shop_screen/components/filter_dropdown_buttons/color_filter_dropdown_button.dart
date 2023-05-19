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
  ConsumerState<ColorFilterDropDownButton> createState() => _ColorFilterDropDownButtonState();
}

class _ColorFilterDropDownButtonState extends ConsumerState<ColorFilterDropDownButton> {




  @override
  Widget build(BuildContext context) {
    final Set<String> colors = ref.read(productsDataProvider.notifier).getColors();
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
        openFilterDialog(colors);
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
    );;
  }

  void openFilterDialog(Set<String> colorsNames) async {
    List<String>? selectedColors = [];


    await FilterListDialog.display<String>(
      context,

      controlButtons: [ControlButtonType.Reset],
      listData: colorsNames.toList(),
      selectedListData: ref.read(colorFilterProvider),
      choiceChipLabel: (color) => color,
      validateSelectedItem: (list, val) => list!.contains(val),
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
            //   ref.read(colorFilterProvider).remove(colorName);
            // }else{
            //   ref.read(colorFilterProvider).add(colorName);
            // }
            //
            // print("${ref.read(colorFilterProvider)} Selected Colors after condition");
          }
        }

        return GestureDetector(
          onTap: (){
            if(ref.read(colorFilterProvider).contains(colorName)){
              ref.read(colorFilterProvider).remove(colorName);
            }else{
              ref.read(colorFilterProvider).add(colorName);
            }
          },
          child: Stack(
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
                  border: ref.watch(colorFilterProvider).contains(colorName)
                      ? ref.watch(colorFilterProvider).contains(colorName)
                      ? Border.all(color: Colors.orange.shade300, width: 2)
                      : null
                      : null,
                ),
              ),
              if (isClicked != null)
                if (ref.watch(colorFilterProvider).contains(colorName))
                  Icon(
                    Icons.close,
                    color: Colors.orange.shade300,
                    size: 10,
                  ),
            ],
          ),
        );
      },
      onApplyButtonClick: (list) async{
        Navigator.pop(context);
        setState(() {
          selectedColors = List.from(list!);

        });
        ref.read(colorFilterProvider.notifier).update((state) => selectedColors!);
        ref.read(shopScreenLoadingDataState.notifier).state = true;

        List<Product>? products = await ref.read(mainFilterMethod);
        ref.read(productsProvider.notifier).state = products!;
        ref.read(shopScreenLoadingDataState.notifier).state = false;

      },

    );
  }
}