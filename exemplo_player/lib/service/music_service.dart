import 'package:exemplo_player/model/music_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class MusicService {
  List<MusicModel> _list = [];
  List<MusicModel> get list => _list;

  final String url = "http://10.109.204.31:3000/music";

  //fetchList()
  Future<List<MusicModel>> fetchList() async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      _list = json.decode(response.body).map((e) => MusicModel.fromMap(e)).toList();
      return _list;
    }
    return [];

  }
}