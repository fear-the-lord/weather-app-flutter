import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      // The output of the jsonDecode() is a dynamic type so we use var,
      // because we won't know the type unless it is processed.
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
