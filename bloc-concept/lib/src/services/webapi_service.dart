import 'dart:convert';

import 'package:cmflutter0/src/models/youtube_response.dart';
import 'package:dio/dio.dart';

class WebApiService {
  Future <List<Youtube>> feed() async {
    final dio = Dio();
     final result = await dio.get(
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
      //make to the object 
      final YoutubeResponse = youtubeResponseFromJson((result.data)) ; 
      print(YoutubeResponse.youtube[3].title);
      return YoutubeResponse.youtube ;           


  }
}

