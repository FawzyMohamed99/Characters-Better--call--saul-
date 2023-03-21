import 'package:bloc_with_omr_ahmed/constants/string.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try{
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.runtimeType);
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try{
      Response response = await dio.get('quotes');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.runtimeType);
      return [];
    }
  }
}
