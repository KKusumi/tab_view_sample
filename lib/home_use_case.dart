import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeUseCaseProvider = Provider((ref) => HomeUseCaseImpl());

abstract class HomeUseCase {
  Future<List<String>> execute(int index);
}

class HomeUseCaseImpl implements HomeUseCase {
  final list = [
    [
      'Bulbasaur',
      'Ivysaur',
      'Venusaur',
      'Charmander',
      'Charmeleon',
      'Charizard',
      'Squirtle',
      'Wartortle',
      'Blastoise',
      'Caterpie',
      'Metapod',
      'Butterfree',
      'Weedle',
      'Kakuna',
      'Beedrill'
    ],
    [
      'Pidgey',
      'Pidgeotto',
      'Pidgeot',
      'Rattata',
      'Raticate',
      'Spearow',
      'Fearow',
      'Ekans',
      'Arbok',
      'Pikachu',
      'Raichu',
      'Sandshrew',
      'Sandslash',
      'Nidoran♀',
      'Nidorina'
    ],
    [
      'Nidoqueen',
      'Nidoran♂',
      'Nidorino',
      'Nidoking',
      'Clefairy',
      'Clefable',
      'Vulpix',
      'Ninetales',
      'Jigglypuff',
      'Wigglytuff',
      'Zubat',
      'Golbat',
      'Oddish',
      'Gloom',
      'Vileplume'
    ],
    [
      'Paras',
      'Parasect',
      'Venonat',
      'Venomoth',
      'Diglett',
      'Dugtrio',
      'Meowth',
      'Persian',
      'Psyduck',
      'Golduck',
      'Mankey',
      'Primeape',
      'Growlithe',
      'Arcanine',
      'Poliwag'
    ],
    [
      'Poliwhirl',
      'Poliwrath',
      'Abra',
      'Kadabra',
      'Alakazam',
      'Machop',
      'Machoke',
      'Machamp',
      'Bellsprout',
      'Weepinbell',
      'Victreebel',
      'Tentacool',
      'Tentacruel',
      'Geodude',
      'Graveler'
    ]
  ];

  @override
  Future<List<String>> execute(int index) {
    // サーバー接続を再現するために1秒ディレイ
    return Future.delayed(const Duration(seconds: 1)).then((_) => list[index]);
  }
}
