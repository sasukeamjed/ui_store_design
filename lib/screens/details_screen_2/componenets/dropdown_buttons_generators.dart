import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/attributes_model.dart';

List<Expanded> dropDownButtonsGenerator(List<AttributesModel> attributes) {

  List<String> attributes;

  attributes = widget.product.getOptions().keys.toList();

  //the map should look like this {"attribute_slug": value, "another_attribute_slug" : value}
  //here we will generate a new map according to the variations given


  return List.generate(attributes.length, (index) {
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
                print("this is the choosed variation => $choosedOptions");
              });
              List<ProductVariationModel> variations = widget.product.productVariations;
              ProductVariationModel variation;

              try{
                variation = variations.firstWhere((variation){

                  // print("The Cross Bonding Variation is => ${mapEquals(variation.attributes, choosenOptions)}");
                  return mapEquals(variation.attributes, choosedOptions);


                });

                String? imageVariation = variation.image.getMediumImage();

                int currentImageIndex = widget.product.images.indexWhere((ImageModel imageModel) => imageModel.src == imageVariation);

                ref.read(imageIndexProvider).animateToPage(currentImageIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
                ref.read(productIsChosenNotifier(widget.product).notifier).getTheCrossBondingVariation(choosedOptions);

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

DropdownButton<String> dropdownButton(int focusIndex, List<String> options){
  return DropdownButton<String>(
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
        print("this is the choosed variation => $choosedOptions");
      });
      List<ProductVariationModel> variations = widget.product.productVariations;
      ProductVariationModel variation;

      try{
        variation = variations.firstWhere((variation){

          // print("The Cross Bonding Variation is => ${mapEquals(variation.attributes, choosenOptions)}");
          return mapEquals(variation.attributes, choosedOptions);


        });

        String? imageVariation = variation.image.getMediumImage();

        int currentImageIndex = widget.product.images.indexWhere((ImageModel imageModel) => imageModel.src == imageVariation);

        ref.read(imageIndexProvider).animateToPage(currentImageIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
        ref.read(productIsChosenNotifier(widget.product).notifier).getTheCrossBondingVariation(choosedOptions);

      }catch(e){
        print("variations_section.dart => no variation");
      }

    },
    onTap: (){
      setState(() {
        _selectedIndex = index;
      });
    },
  );
}
