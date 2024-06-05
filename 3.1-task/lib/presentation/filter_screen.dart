import 'package:check/domain/sorting_type.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final SortingType filter;

  const FilterScreen({Key? key, required this.filter}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late SortingType _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 28),
        itemBuilder: (_, i) {
          final type = FilterType.values[i];
          final sortingList =
              SortingType.values.where((e) => e.type == type).toList();
          final isLastType = i == FilterType.values.length - 1;

          return sortingList.isNotEmpty
              ? _FilterTypeWidget(
                  type: type,
                  sortingList: sortingList,
                  selectedFilter: _selectedFilter,
                  isLastType: isLastType,
                  onChanged: _onChanged,
                  onDone: _onPressedDone,
                )
              : const SizedBox();
        },
        itemCount: FilterType.values.length,
      ),
    );
  }

  void _onChanged(SortingType? value) {
    if (value == null || value == _selectedFilter) return;

    setState(() {
      _selectedFilter = value;
    });
  }

  void _onPressedDone() {
    Navigator.of(context).pop(_selectedFilter);
  }
}

class _FilterTypeWidget extends StatelessWidget {
  final FilterType type;
  final List<SortingType> sortingList;
  final SortingType selectedFilter;
  final bool isLastType;
  final ValueChanged<SortingType?> onChanged;
  final VoidCallback onDone;

  const _FilterTypeWidget({
    Key? key,
    required this.type,
    required this.sortingList,
    required this.selectedFilter,
    required this.isLastType,
    required this.onChanged,
    required this.onDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (type == FilterType.none) Text(type.name),
        ...sortingList
            .map((e) => RadioListTile<SortingType>(
                  title: Text(e.name),
                  value: e,
                  groupValue: selectedFilter,
                  onChanged: onChanged,
                ))
            .toList(),
        const Divider(),
        if (isLastType) ...[
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: onDone,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(103, 205, 0, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Готово',
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ],
    );
  }
}
