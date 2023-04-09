import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/colors_library/string_color_genrator.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
import 'package:ui_store_design/providers/data_providers.dart';

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
      listData: colorsNames.toList(),
      selectedListData: selectedColors,
      choiceChipLabel: (color) => color,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (color, query) {
        return color.toLowerCase().contains(query.toLowerCase());
      },
      choiceChipBuilder: (context, colorName, isClicked) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                border: isClicked != null
                    ? isClicked
                    ? Border.all(color: Colors.orange.shade300, width: 2)
                    : null
                    : null,
              ),
            ),
            if (isClicked != null)
              if (isClicked)
                Icon(
                  Icons.close,
                  color: Colors.orange.shade300,
                  size: 10,
                ),
          ],
        );
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedColors = List.from(list!);

        });
        ref.read(colorFilterProvider.notifier).update((state) => selectedColors);
        Navigator.pop(context);
      },
    );
  }
}