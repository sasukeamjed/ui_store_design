import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/attributes_model.dart';
import 'package:ui_store_design/models/image_model.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/providers/chosen_product_state/chosen_product_notifier.dart';
import 'package:ui_store_design/providers/image_notifier.dart';
import 'package:ui_store_design/screens/details_screen_2/helper_methods/helper_methods.dart';

class VariationsSection extends ConsumerStatefulWidget  {
  const VariationsSection({required this.product,
    Key? key
  }) : super(key: key);

  final Product product;

  @override
  ConsumerState<VariationsSection> createState() => _VariationsSectionState();
}

class _VariationsSectionState extends ConsumerState <VariationsSection> {

  List<List<String>> dropdownValues = [];
  List<dynamic> newIndexes = [];
  int _selectedIndex = 0;
  late FocusNode dropDownFocus;
  late Map<String, dynamic> choosedOptions;


  @override
  void initState() {
    //we have to keep track of the index of the value of every dropdown button
    //we get the index of the value from onChange method in DropDownButton
    choosedOptions = Map.fromIterable(widget.product.getOptions().keys.toList(), key:(key)=> key, value: (e) => null);

    newIndexes = List.generate(widget.product.getOptions().length, (index) => null);
    widget.product.getOptions().forEach((key, List<String> values) {
      //Adding each list in the map to the List<List<String>> dropdownValues
      dropdownValues.add(values);
    });
    dropDownFocus = FocusNode();
    super.initState();
  }



  List<Expanded> dropDownButtonsGenerator() {

    List<String> attributes;

    attributes = widget.product.getOptions().keys.toList();

    //the map should look like this {"attribute_slug": value, "another_attribute_slug" : value}
    //here we will generate a new map according to the variations given

      
    return List.generate(dropdownValues.length, (index) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: _selectedIndex == index ? Colors.green : Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              underline: DropdownButtonHideUnderline(child: Container(),),
              value:  newIndexes[index] == null ? null : dropdownValues[index][newIndexes[index]],
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(removeAttributePa(attributes[index])),
              ),
              items: List.generate(dropdownValues[index].length, (insideIndex) {
                return DropdownMenuItem<String>(child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(dropdownValues[index][insideIndex].capitalize()),
                ), value: dropdownValues[index][insideIndex],);
              }),
              onChanged: (newValue){
                // FocusScope.of(context).requestFocus(dropDownFocus);
                setState(() {
                  var newIndex = dropdownValues[index].indexOf(newValue!);
                  newIndexes[index] = newIndex;
                  choosedOptions[attributes[index]] = newValue;

                });


                try{
                  ProductVariationModel? variation = ref.read(productIsChosenNotifier(widget.product).notifier).getTheCrossBondingVariation(choosedOptions);

                  ImageModel? imageVariation = variation?.image;

                  int currentImageIndex = widget.product.images.indexWhere((ImageModel imageModel) => imageModel.id == imageVariation?.id);

                  ref.read(imageIndexProvider).animateToPage(currentImageIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);


                }catch(e){
                  print("variations_section.dart => no variation");
                }

              },
              onTap: (){
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      );
      });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Choose Your Product:",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...dropDownButtonsGenerator(),
          ],
        ),
      ],
    );
  }
}


