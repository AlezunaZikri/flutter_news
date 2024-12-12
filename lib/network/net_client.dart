import 'package:flutter_news/model/antara_news.dart';
import 'package:flutter_news/model/cnn_news.dart';
import 'package:http/http.dart' as http;

class NetClient {
  final String url = "https://berita-indo-api-next.vercel.app/api/";

  Future<ResponseCnn> fetchCnn () async{
    const endPoint = "cnn-news/olahraga";
    final response = await http.get(Uri.parse(url + endPoint));

    try {
      if(response.statusCode == 200) {
        return responseCnnFromJson(response.body);
      }else {
        throw Exception('Failed to load news');
      } 
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ResponseAntara> fetchAntara() async {
    const endPoint = "antara-news/olahraga";
    final response = await http.get(Uri.parse(url + endPoint));

    try {
      if (response.statusCode == 200) {
        return responseAntaraFromJson(response.body);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}