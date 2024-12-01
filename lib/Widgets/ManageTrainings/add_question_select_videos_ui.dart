import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef LabelExtractor<T> = String Function(T item);

class AddQuestionSelectItemsUI<T> extends HookConsumerWidget {
  const AddQuestionSelectItemsUI({
    super.key,
    required this.itemsList,
    required this.selectedItems,
    required this.onSelectedItemsChanged,
    required this.labelExtractor,
    this.searchVisible = true,
  });

  final bool searchVisible;
  final List<T> itemsList;
  final List<T> selectedItems;
  final ValueSetter<List<T>> onSelectedItemsChanged;
  final LabelExtractor<T> labelExtractor;

  @override
  Widget build(BuildContext context, ref) {
    final filteredItems = useState(itemsList);
    return SingleChildScrollView(
      child: Column(
        children: [
          if (searchVisible)
            BorderedInput(
              placeholder: 'Search',
              initialValue: null,
              onChanged: (text) {
                final filtered = itemsList
                    .where((element) => labelExtractor(element)
                        .toLowerCase()
                        .contains((text ?? '').toLowerCase()))
                    .toList();
                filteredItems.value = filtered;
              },
            ),
          ...filteredItems.value.asMap().entries.map((entry) {
            final item = entry.value;
            return TouchableOpacity(
              onTap: () {
                final newSelectedItems = [...selectedItems];
                if (newSelectedItems.contains(item)) {
                  newSelectedItems.remove(item);
                } else {
                  newSelectedItems.add(item);
                }
                onSelectedItemsChanged(newSelectedItems);
              },
              child: Container(
                color: CustomColors.mainBackground,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        labelExtractor(item),
                        style: const TextStyle(color: CustomColors.gray),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      selectedItems.contains(item)
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: selectedItems.contains(item)
                          ? CustomColors.applicationColorMain
                          : Colors.grey,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
