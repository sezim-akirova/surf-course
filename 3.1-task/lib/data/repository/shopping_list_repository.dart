import 'package:check/data/mock_data.dart';
import 'package:check/domain/cheque_entity.dart';

 class ShoppingListRepository {
  Future<ChequeEntity> getChegue(int id) async {
    return Future.value(
      ChequeEntity(
        id: id,
        date: DateTime(2024, 2, 23, 12,23),
        products: dataForStudents,
      )
    );
  }
 }