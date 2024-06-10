class MusicModel{
  final String title;
  final String url;

  //costrutor
  MusicModel({required this.title, required this.url});

  //fromJson
  factory MusicModel.fromJson(Map<String, dynamic> json){
    return MusicModel(
      title: json['title'],
      url: json['url'],
    );
  }
  
}