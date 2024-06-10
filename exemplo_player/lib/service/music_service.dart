import 'package:exemplo_player/model/music_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MusicService {
  final Uri url = "http//Meu url do Json";

   List<MusicModel> _listMusic = [];
   List<MusicModel> get listMusic => _listMusic;

   Future<List<MusicModel>> getListMusic() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _listMusic = json.decode(response.body).map((e) => MusicModel.fromJson(e)).toList();
      return _listMusic;
    } else {
      throw Exception("Não foi possível carregar os dados");
    }
  }


}