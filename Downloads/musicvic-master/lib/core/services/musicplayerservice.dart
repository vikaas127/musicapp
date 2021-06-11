import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicvic/Model/musicplayer.dart';
import 'package:musicvic/core/api/api.dart';
import 'package:musicvic/core/api/endpoints.dart';
class MusicService extends GetxController {



  Future<http.Response> viewArtist( String Artist_id,  String User_id) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.Like );
    Map body = {
      "artist_id": Artist_id,
      "user_id": User_id,

    };
    final response = await http.post(
        uri,body:body
      // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> viewAlbum( String Album_id,  String User_id) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.UnLike );
    Map body = {
      "album_id": Album_id,
      "user_id": User_id,

    };
    final response = await http.post(
        uri,body:body
      // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> musicplayer( String musicid,  String userid) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.PlayMusic );
    Map body = {
      "music_id": musicid,
      "user_id": userid,

    };
    final response = await http.post(
        uri,body:body
      // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> Like( String Like_type,  String Like_type_id) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.Like );
    Map body = {
      "like_type": Like_type,
      "like_type_id": Like_type_id,

    };
    final response = await http.post(
        uri,body:body
      // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> UnLike( String Like_type,  String Like_type_id) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.UnLike );
    Map body = {
      "like_type": Like_type,
      "like_type_id": Like_type_id,

    };
    final response = await http.post(
        uri,body:body
      // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
}