import 'package:check/domain/product_entity.dart';
import 'package:check/domain/sorting_type.dart';

///Расширение для сортировки списка продуктов
extension ProductListX on List<ProductEntity> {
  List<ProductEntity> sortByFilter(SortingType type) {
    final List<ProductEntity> sortedList = switch (type) {
      SortingType.none => this,
      SortingType.nameFromA => _sortByName(this),
      SortingType.nameFromZ => _sortByName(this, isFromA: false),
      SortingType.ascendingOrder => _sortByPrice(this),
      SortingType.descendingOrder => _sortByPrice(this, isCheapFirst: false),
      SortingType.typeFromA => this,
      SortingType.typeFromZ => this,
    };

    return sortedList;
  }

  ///По умолчания сначала дешевый товар
  List<ProductEntity> _sortByPrice(List<ProductEntity> initialList,
      {bool isCheapFirst = true}) {
    final result = List<ProductEntity>.from(initialList);

    result.sort((a, b) => isCheapFirst
        ? a.decimalPrice.compareTo(b.decimalPrice)
        : b.decimalPrice.compareTo(a.decimalPrice));

    return result;
  }

  List<ProductEntity> _sortByName(List<ProductEntity> initialList,
      {bool isFromA = true}) {
    final result = List<ProductEntity>.from(initialList);

    result.sort((a, b) =>
        isFromA ? a.title.compareTo(b.title) : b.title.compareTo(a.title));

    return result;
  }
}
