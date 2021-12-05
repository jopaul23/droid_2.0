import 'package:http/http.dart' as http;

class Api {
  static const url = "http://10.100.26.7:5000";

  static void getCertificate(int id) async {
    print("calling");
    final urLink = Uri.parse(url + "/test");
    final response = await http.post(urLink, body: {'id': ' '});
    print('Response status: ${response.statusCode}');

    print(response.body);
  }

  static void update(int id, var value, var tag) async {
    final urLink = Uri.parse(url + '/updateRefershment');
     final response = await http.post(urLink, body: {'id': id,'value':value,'tag':tag});
  }
}
