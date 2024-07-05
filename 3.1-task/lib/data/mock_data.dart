import 'package:check/domain/amount.dart';
import 'package:check/domain/category_type.dart';
import 'package:check/domain/product_entity.dart';

final dataForStudents = <ProductEntity>[
  ProductEntity(
    title: 'Арбуз',
    price: 1200,
    category: Category.food,
    imageUrl:
        'https://images.unsplash.com/photo-1589984662646-e7b2e4962f18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
    amount: Grams(1000),
    sale: 50,
  ),
  ProductEntity(
    title: 'Дыня',
    price: 1400,
    category: Category.food,
    amount: Grams(2000),
    imageUrl:
        'https://images.unsplash.com/photo-1598025362874-49480e049c76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWVsb258ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Телевизор',
    price: 2100000,
    category: Category.tech,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1328&q=80',
  ),
  ProductEntity(
    title: 'Миксер',
    price: 250000,
    category: Category.tech,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1578643463396-0997cb5328c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWl4ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Крем для загара',
    price: 90000,
    category: Category.care,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1521223344201-d169129f7b7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80',
  ),
  ProductEntity(
    title: 'Крем защитный',
    price: 1900,
    category: Category.care,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1611080541599-8c6dbde6ed28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
  ),
  ProductEntity(
    title: 'Pebsi',
    price: 9000,
    category: Category.drinks,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1567671899076-51a64ddb7c5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ymx1ZSUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Shpryte',
    price: 10200,
    category: Category.drinks,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1541807120430-f3f78c281225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JlZW4lMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Аспирин',
    price: 15,
    amount: Quantity(1),
    category: Category.drugs,
    imageUrl:
        'https://images.unsplash.com/photo-1626716493137-b67fe9501e76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXNwaXJpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Ибупрофен',
    price: 504,
    category: Category.drugs,
    amount: Quantity(1),
    imageUrl:
        'https://images.unsplash.com/photo-1550572017-edd951b55104?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aWJ1cHJvZmVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  ),
  ProductEntity(
    title: 'Клубника',
    price: 3000,
    category: Category.food,
    amount: Quantity(500),
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/01/17/22/24/strawberries-3089148_1280.jpg',
  ),
  ProductEntity(
    title: 'Малина',
    price: 2500,
    category: Category.food,
    amount: Quantity(700),
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/04/23/42/raspberries-3454504_960_720.jpg',
  ),
  ProductEntity(
    title: 'Fanta',
    price: 10100,
    category: Category.drinks,
    amount: Quantity(1),
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzSP0ddqOddWwDeygOO9yZqBwWu7U1wyDBMg&s',
  ),
];
