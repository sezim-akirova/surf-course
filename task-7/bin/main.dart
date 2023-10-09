class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int qty;

  Product(
      {required this.id,
      required this.category,
      required this.name,
      required this.price,
      required this.qty});
}

abstract class Filter {
  bool apply(Product product);
}

class CategoryFilter extends Filter {
  final String targetCategory;

  CategoryFilter(this.targetCategory);

  @override
  bool apply(Product product) {
    return product.category == targetCategory;
  }
}

class PriceFilter extends Filter {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Product product) {
    return product.price == maxPrice;
  }
}

class QuantityFilter extends Filter {
  final int maxQty;

  QuantityFilter(this.maxQty);

  @override
  bool apply(Product product) {
    return product.qty < maxQty;
  }
}

void applyFilter(List<Product> products, Filter filter) {
  final filteredProducts =
      products.where((product) => filter.apply(product)).toList();

  print("ID\tCategory\tName\tPrice\tQty");
  for (final product in filteredProducts) {
    print(
        "${product.id}\t${product.category}\t${product.name}\t${product.price} рублей\t${product.qty} шт");
  }
}

void main() {
  final List<Product> productList = [
    Product(id: 1, category: 'хлеб', name: 'Бородинский', price: 500, qty: 5),
    Product(id: 2, category: 'хлеб', name: 'Белый', price: 200, qty: 15),
    Product(
        id: 3, category: 'молоко', name: 'Полосатый кот', price: 50, qty: 53),
    Product(id: 4, category: 'молоко', name: 'Коровка', price: 50, qty: 53),
    Product(id: 5, category: 'вода', name: 'Апельсин', price: 25, qty: 100),
    Product(id: 6, category: 'вода', name: 'Бородинский', price: 500, qty: 5),
  ];

  final categoryFilter = CategoryFilter('вода');
  final priceFilter = PriceFilter(500);
  final quantityFilter = QuantityFilter(100);

  print("Category Filter:");
  applyFilter(productList, categoryFilter);

  print("\nPrice Filter:");
  applyFilter(productList, priceFilter);

  print("\nQuantity Filter:");
  applyFilter(productList, quantityFilter);
}
