import 'package:http/http.dart' as http;

class Api {
  static const url = "http://172.16.201.128:5000";

  static void getCertificate(int id) async {
    print("calling");
    final urLink = Uri.parse(url + "/test");
    final response =
        await http.post(urLink, body: {'id': 'doodle', '': 'blue'});
    print('Response status: ${response.statusCode}');

    print(response.body);
  }
}
