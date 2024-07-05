import 'package:check/data/repository/shopping_list_repository.dart';
import 'package:check/presentation/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(const MyApp()),
  );
}

final shoppingListRepository = ShoppingListRepository();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const TabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
