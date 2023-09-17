// OOO "Travka-muravka"

enum Countries { brazil, russia, turkish, spain, japan }

  void main() {
  /// 1. Выписываем все трактора.
  final machineries = collectAllMachinery();

  /// 2. Сортируем технику по дате.
  machineries.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  /// 3. Высчитываем средний возраст техники.
  print(calculateAverageAge(machineries));

  /// 3. Высчитываем средний возраст половины техники.
  print(calculateAverageAge(machineries.sublist(machineries.length ~/ 2)));
}

List<AgriculturalMachinery> collectAllMachinery() {
  final result = <AgriculturalMachinery>[];

  final mergedJournals = <Countries, List<Territory>>{};

  for (final key in mapBefore2010.keys) {
    if (mergedJournals[key] == null) {
      mergedJournals[key] = mapBefore2010[key]!;
    } else {
      mergedJournals[key]!.addAll(mapBefore2010[key]!);
    }
  }

  for (final key in mapAfter2010.keys) {
    if (mergedJournals[key] == null) {
      mergedJournals[key] = mapAfter2010[key]!;
    } else {
      mergedJournals[key]!.addAll(mapAfter2010[key]!);
    }
  }

  for (final value in mergedJournals.values) {
    for (final territory in value) {
      result.addAll(territory.machineries.cast<AgriculturalMachinery>());
    }
  }
  return result;
}

double calculateAverageAge(List<AgriculturalMachinery> machinery) {
  final now = DateTime.now();
  final length = machinery.length;
  var sum = 0;

  for (final machine in machinery) {
    sum += now.difference(machine.releaseDate).inDays ~/ 365;
  }

  return sum / length;
}

  


class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};