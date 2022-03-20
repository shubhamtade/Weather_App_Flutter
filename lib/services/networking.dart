import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    final response = await http.get(Uri.parse(url));

    // print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
      // JSON data should not have x( ). So, we remove it
      data = data.replaceAll('test(', '').replaceAll(')', '');
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
