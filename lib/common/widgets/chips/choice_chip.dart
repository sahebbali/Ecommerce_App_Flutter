

import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HkChoiceChip extends StatelessWidget {
  const HkChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,

  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HkHelperFunctions.getColor(text) != null;
    final color = HkHelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
          labelStyle: TextStyle(color: selected ? HkColors.white : null),
        avatar: isColor
            ? HkCircularContainer(
          width: 50,height: 50,
          backgroundColor: color!,
        ) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor  ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        selectedColor: color,
      ),
    );
  }
}