import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuButton extends HookConsumerWidget {
  const MenuButton(
      {super.key,
      this.dropdownValue,
      required this.items,
      required this.header,
      required this.onChanged});
  final String? dropdownValue;
  final String header;
  final List<String> items;
  final ValueSetter<String?> onChanged;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(2, 0, 0, 2),
            child: Text(header,
                style:
                    const TextStyle(color: CustomColors.gray, fontSize: 10))),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(
              color: CustomColors.gray,
              width: 0.5,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: DropdownButton(
            isExpanded: true,
            borderRadius: BorderRadius.circular(4),
            underline: const SizedBox(),
            hint: Text(
              header,
              style: const TextStyle(color: CustomColors.gray),
            ),
            value: dropdownValue,
            style: const TextStyle(color: CustomColors.gray),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
