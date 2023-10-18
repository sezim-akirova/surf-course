class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int qty;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.qty,
  });
}

List<Product> parseProducts(String input) {
  final List<Product> productList = [];
  final List<String> lines = input.trim().split('\n');

  for (final line in lines) {
    final List<String> parts = line.split(',');
    if (parts.length == 5) {
      final int id = int.parse(parts[0]);
      final String category = parts[1];
      final String name = parts[2];
      final int price = int.parse(parts[3]);
      final int qty = int.parse(parts[4]);
      final Product product = Product(
          id: id, category: category, name: name, price: price, qty: qty);
      productList.add(product);
    }
  }

  return productList;
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
    return product.price <= maxPrice;
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
  final String articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  final List<Product> productList = parseProducts(articles);

  final categoryFilter = CategoryFilter('хлеб');
  final priceFilter = PriceFilter(500);
  final quantityFilter = QuantityFilter(10);

  print("Category Filter:");
  applyFilter(productList, categoryFilter);

  print("\nPrice Filter:");
  applyFilter(productList, priceFilter);

  print("\nQuantity Filter:");
  applyFilter(productList, quantityFilter);
}
