// Nama : Fadhlan Hisyam
// NIM  : 124200022
// Plug : A

import 'base_network.dart';

class MatchesSource {
  static MatchesSource instance = MatchesSource();
  Future<List<dynamic>> LoadMatches() {
    return BaseNetwork.getList('matches');
  }
}