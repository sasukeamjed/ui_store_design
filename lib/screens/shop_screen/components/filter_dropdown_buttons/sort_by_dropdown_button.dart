import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';

class SortByDropDownButton extends StatefulWidget {
  const SortByDropDownButton(
      {Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;

  @override
  State<SortByDropDownButton> createState() => _SortByDropDownButtonState();
}

class _SortByDropDownButtonState extends State<SortByDropDownButton> {
  late dynamic dropdownValue = null;

  @override
  void initState() {
    // dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          return DropdownButton<SortByFilter>(
            hint: Center(
              child: Text(
                widget.hintText,
                style: TextStyle(
                    fontFamily: "Avenir-Book",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (SortByFilter? value) {
              // This is called when the user selects an item.
              ref.read(sortByProvider.notifier).update((state) => value!);

              setState(() {
                dropdownValue = value!;
              });
            },
            items: SortByFilter.values.where((SortByFilter value) => value != SortByFilter.initial).map<DropdownMenuItem<SortByFilter>>((SortByFilter value) {
              return DropdownMenuItem<SortByFilter>(
                value: value,
                child: Center(
                  child: Text(
                    value.name.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
          );
        }
    );
  }
}