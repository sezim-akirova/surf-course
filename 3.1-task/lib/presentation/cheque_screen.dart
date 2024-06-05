// Экран с чеком
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:check/domain/category_type.dart';
import 'package:check/domain/cheque_entity.dart';
import 'package:check/domain/product_entity.dart';
import 'package:check/domain/sorting_type.dart';
import 'package:check/main.dart';
import 'package:check/presentation/empty_screen.dart';
import 'package:check/presentation/filter_screen.dart';
import 'package:check/presentation/utils/date_time_x.dart';
import 'package:check/presentation/utils/decimal_x.dart';
import 'package:check/presentation/utils/product_list_x.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChequeScreen extends StatefulWidget {
  final int id;

  const ChequeScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ChequeScreen> createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
  Future<ChequeEntity>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = shoppingListRepository.getChegue(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChequeEntity>(
      future: _data,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return data != null
                ? _ContentWidget(data: data)
                : const EmptyScreen();
          }
        }

        return const _LoadingWidget();
      },
    );
  }
}

class _ContentWidget extends StatefulWidget {
  final ChequeEntity data;

  const _ContentWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<_ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            // SizedBox(
            //   width: 50,
            //   child: IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.chevron_left,
            //         color: Color.fromRGBO(103, 205, 0, 1),
            //       )),
            // ),
            Text(
              'Чек № ${widget.data.id}',
              style: const TextStyle(
                fontFamily: 'Sora',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 40, 73, 1),
              ),
            ),
            Text(
              widget.data.date.toStringDateAndTime(),
              //style: Theme.of(context).textTheme.labelSmall,
              style: const TextStyle(
                fontFamily: 'Sora',
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(96, 96, 123, 1),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Список покупок',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37, 40, 73, 1),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _onPressedFilter();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromRGBO(241, 241, 241, 1),
                    ),
                    child: const Icon(Icons.sort),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        itemBuilder: (_, i) {
          final cat = Category.values[i];
          final categoryProducts = widget.data.products
              .where((product) => product.category == cat)
              .toList();
          final isLastCat = i == Category.values.length - 1;

          return categoryProducts.isNotEmpty
              ? _CategoryWidget(
                  category: cat.name,
                  productsOfCategory: categoryProducts,
                  products: widget.data.products,
                  isLastCat: isLastCat,
                  filter: _currentFilter,
                )
              : const SizedBox();
        },
        itemCount: Category.values.length,
      ),
    );
  }

  Future<void> _onPressedFilter() async {
    final SortingType? filter = await showFlexibleBottomSheet(
      initHeight: 0.8,
      bottomSheetColor: Colors.transparent,
      context: context,
      builder: (_, __, ___) => FilterScreen(filter: _currentFilter),
      isExpand: true,
    );

    if (filter == null) return;

    if (filter != _currentFilter) {
      setState(() {
        _currentFilter = filter;
      });
    }
  }
}

class _CategoryWidget extends StatelessWidget {
  final String category;
  final List<ProductEntity> productsOfCategory;
  final List<ProductEntity> products;
  final bool isLastCat;
  final SortingType filter;

  const _CategoryWidget({
    Key? key,
    required this.category,
    required this.productsOfCategory,
    required this.products,
    required this.isLastCat,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(category),
        ...productsOfCategory
            .sortByFilter(filter)
            .map<Widget>((e) => ProductEntity(
                  title: e.title,
                  price: e.price,
                  category: e.category,
                  imageUrl: e.imageUrl,
                  amount: e.amount,
                ))
            .toList(),
        const Divider(),
        if (isLastCat)
          _FinancialWidget(
            products: products,
          ),
      ],
    );
  }
}

class _FinancialWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const _FinancialWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullTotal = _getFullTotal(products);
    final discount = _getDiscount(products);
    final total = fullTotal - discount;

    return Column(
      children: [
        const Text(
          'В вашей покупке',
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(37, 40, 73, 1),
          ),
        ),
        _RowWidget(
            description: _plural(products.length),
            value: fullTotal.toFormattedCurrency()),
        _RowWidget(
            description: 'Скидка 0%', value: discount.toFormattedCurrency()),
        _RowWidget(
          description: 'Итого',
          value: total.toFormattedCurrency(),
        )
      ],
    );
  }

  // Склонение слова -товар
  String _plural(int count) {
    return Intl.plural(
      count,
      zero: 'нет товаров',
      one: '$count товар',
      few: '$count товара',
      many: '$count товаров',
      other: '$count товара',
      locale: 'ru',
    );
  }

  /// Стоимость товаров
  /// 'fold' функция объединения
  Decimal _getFullTotal(List<ProductEntity> products) {
    return products.fold<Decimal>(Decimal.zero,
        (previousValue, element) => previousValue + element.decimalPrice);
  }

  /// Итог по скидке
  Decimal _getDiscount(List<ProductEntity> products) {
    /// получаем список товаров с дисконтом
    final discount = products.where((element) => element.sale > 0).toList();

    return discount.isEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountForProduct(
                  element.decimalPrice,
                  element.sale.toString(),
                ),
          );
  }

  /// Расчет скидки для одного товара
  /// Скидка в процентах
  Decimal _calculateDiscountForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}

/// Виджет для отображения данных в финансовом блоке
class _RowWidget extends StatelessWidget {
  final String description;
  final String value;

  const _RowWidget({Key? key, required this.description, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(child: Text(description, style: textTheme.bodyMedium)),
        Text(value, style: textTheme.headlineSmall),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Произошла ошибка!'),
    );
  }
}
