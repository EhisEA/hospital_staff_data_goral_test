import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchDataService {
 Future<Map>getData() async {
    try {
      String url = "http://gorals-flutter-test.herokuapp.com/";
      var response = await http.get(url);
      Map result = json.decode(response.body);
      
      return result;
    } catch (e) {}
  }
}
